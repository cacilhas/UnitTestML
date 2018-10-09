structure TestCase : TEST_CASE =
struct
  type testMethod = unit -> unit
  type test       = string * testMethod

  local
    val message : string list ref = ref nil
    val tests   : test list ref = ref nil
    val count   : int array = Array.array (3, 0)

    fun incrCount pos =
      Array.update (count, pos, (Array.sub (count, pos)) + 1)

    fun showCount pos =
      Int.toString (Array.sub (count, pos))

    fun runTest (msg, body) = ignore
      ( print ("[" ^ msg ^ "] ")
      ; body ()
      ; print "\027[32;1mok\027[0m\n"
      ; incrCount 0
      ; incrCount 1
      )
      handle
        AssertionError msg =>
          ( print ("\027[31massertion error: " ^ msg ^ "\027[0m\n")
          ; incrCount 0
          ; incrCount 2
          )
        | e =>
          ( print ("\027[31;1m" ^ (exnMessage e) ^ "\027[0m\n")
          ; incrCount 0
          ; incrCount 2
          )

  in
    fun describe description body = ignore
      let
        val current = !message
      in message := current @ [description]
       ; body ()
       ; message := current
      end

    fun it description body = ignore
      let
        val key =
          (String.concatWith " :: " (!message)) ^ " :: it " ^ description
      in
        tests := (!tests) @ [(key, body)]
      end

    fun run () = ignore
      ( List.app runTest (!tests)
        before print (
          "\027[1m--------------------------------\027[0m\n" ^
          "\027[34;1mrun " ^ (showCount 0) ^ "\027[0m\n" ^
          "\027[32;1msucceed " ^ (showCount 1) ^ "\027[0m\n" ^
          "\027[31;1mfailed " ^ (showCount 2) ^ "\027[0m\n"
        )
      )
  end
end

val () = OS.Process.atExit TestCase.run
