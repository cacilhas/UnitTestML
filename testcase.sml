structure TestCase : TEST_CASE =
struct
  type test = string * (unit -> unit)

  local
    val message : string list ref = ref []
    val tests   : test list ref = ref []
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
            print ("\027[31;1massertion error " ^ msg ^ "\027[0m\n");
            let
              val c = !count
            in
              count := (#1c + 1, #2c, #3c + 1)
            end
          )
        | _ =>
          (
            print "\027[31;1mexception raised\027[0m\n";
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

local
  val _ = OS.Process.atExit TestCase.run
in
end
