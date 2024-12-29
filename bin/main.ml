open Xmlm

let extract_up_ips file_path =
  let input_channel = open_in file_path in
  let xml_input = make_input ~strip:true (`Channel input_channel) in

  let convert_attrs attrs =
    List.map (fun ((_, key), value) -> (key, value)) attrs
  in

  let parse_ips acc = function
    | `El_start ((_, tag), attrs) when tag = "address" ->
        let attrs = convert_attrs attrs in
        let addr = List.assoc_opt "addr" attrs in
        let addrtype = List.assoc_opt "addrtype" attrs in
        begin match addr, addrtype with
        | Some ip, Some "ipv4" -> ip :: acc
        | _ -> acc
        end
    | _ -> acc
  in

  let rec read acc =
    match input xml_input with
    | `El_start _ as el -> read (parse_ips acc el)
    | `El_end -> acc
    | `Data _ | `Dtd _ -> read acc
    | exception End_of_file -> acc
  in

  let addresses = read [] in
  close_in input_channel;
  addresses

let print_up_ips addresses =
  if List.length addresses = 0 then
    Printf.printf "No up IPs found.\n"
  else
    print_endline (String.concat "," addresses)

let () =
  if Array.length Sys.argv < 2 then
    Printf.eprintf "Usage: %s <nmap.xml>\n" Sys.argv.(0)
  else
    let addresses = extract_up_ips Sys.argv.(1) in
    print_up_ips addresses
