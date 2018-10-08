structure TestCase : TEST_CASE =
struct
  type testMethod = unit -> unit
  type test       = string * testMethod

  local
    val message : string list ref = ref nil
    val tests   : test list ref = ref nil
    val count   : (int * int * int) ref = ref (0, 0, 0)

    fun runTest (msg, body) = ignore
      let
        val c = !count
      in
        ( print ("[" ^ msg ^ "] ")
        ; body ()
        ; print "\027[32;1mok\027[0m\n"
        ; count := (#1c + 1, #2c + 1, #3c)
        )
        handle
          AssertionError msg =>
            ( print ("\027[31massertion error: " ^ msg ^ "\027[0m\n")
            ; count := (#1c + 1, #2c, #3c + 1)
            )
          | e =>
            ( print ("\027[31;1m" ^ (exnMessage e) ^ "\027[0m\n")
            ; count := (#1c + 1, #2c, #3c + 1)
            )
      end

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
        val key =
          (String.concatWith " :: " (!message)) ^ " :: it " ^ description
      in
        tests := (!tests) @ [(key, body)]
      end

    fun run () = ignore
      let
        val c = !count
      in
        List.app runTest (!tests)
        before print (
          "\027[1m--------------------------------\027[0m\n" ^
          "\027[34;1mrun " ^ (Int.toString (#1c)) ^ "\027[0m\n" ^
          "\027[32;1msucceed " ^ (Int.toString (#2c)) ^ "\027[0m\n" ^
          "\027[31;1mfailed " ^ (Int.toString (#3c)) ^ "\027[0m\n"
        )
      end
  end
end

val () = OS.Process.atExit TestCase.run
