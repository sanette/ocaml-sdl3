open Printf

let default_flags = Dl.[ RTLD_NOW; RTLD_GLOBAL ]

let load ?env ?(debug=false) ~name candidates =
  let flags = default_flags in

  let candidates =
    match env with
    | Some var ->
      begin match Sys.getenv_opt var with
        | Some path -> path :: candidates
        | None -> candidates
      end
    | None -> candidates
  in

  let errors = ref [] in

  let rec try_all = function
    | [] -> None
    | filename :: rest ->
      try
        print_endline filename;
        let dl = Dl.dlopen ~flags ~filename in
        print_endline ("chosen: " ^ filename);
        Some dl
      with exn ->
        errors := (filename, exn) :: !errors;
        try_all rest
  in

  match try_all candidates with
  | Some h -> Some h
  | None ->
    if debug then begin
      prerr_endline (sprintf "dynlib: could not load %s." name);
      prerr_endline "dynlib: tried:";
      List.iter (fun (file, exn) ->
          prerr_endline (sprintf "  - %s (%s)" file (Printexc.to_string exn)))
        (List.rev !errors);
      match env with
      | Some var ->
        prerr_endline (sprintf "You may use the %s environement variable to \
                                specify the %s library file." var name)
      | None -> ()
    end;
    None
