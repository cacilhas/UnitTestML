structure TestCase : TEST_CASE =
struct
  type test_method = unit -> unit
  type test        = string * test_method

  local
    val message : string list ref = ref nil
    val tests   : test list ref = ref nil
    val count   : (int * int * int) ref = ref (0, 0, 0)

    fun run_test (msg, body) = ignore
      (
        print ("[" ^ msg ^ "] ");
        body ();
        print "\027[32;1mok\027[0m\n";
        let
          val c = !count
        in
          count := (#1c + 1, #2c + 1, #3c)
        end
      )
      handle
        AssertionError msg =>
          (
            print ("\027[31massertion error: " ^ msg ^ "\027[0m\n");
            let
              val c = !count
            in
              count := (#1c + 1, #2c, #3c + 1)
            end
          )
        | e =>
          (
            print ("\027[31;1m" ^ (exnMessage e) ^ "\027[0m\n");
            let
              val c = !count
            in
              count := (#1c + 1, #2c, #3c + 1)
            end
          )

  in
    fun describe description body = ignore
      let
        val current = !message
      in
        message := current @ [description];
        body ();
        message := current
      end

    fun it description body = ignore
      let
        val current = (!message) @ [description]
        val key = String.concatWith " :: " current
      in
        tests := (!tests) @ [(key, body)]
      end

    fun run () = ignore
      (
        List.app run_test (!tests)
        before let
          val c = !count
        in
          print (
            "\027[1m--------------------------------\027[0m\n" ^
            "\027[34;1mrun " ^ (Int.toString (#1c)) ^ "\027[0m\n" ^
            "\027[32;1msucceed " ^ (Int.toString (#2c)) ^ "\027[0m\n" ^
            "\027[31;1mfailed " ^ (Int.toString (#3c)) ^ "\027[0m\n"
          )
        end
      )
  end
end

val () = OS.Process.atExit TestCase.run
