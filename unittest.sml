structure UnitTest : UNIT_TEST =
struct
  local
    fun assert' msg true  = ()
      | assert' msg false = raise (AssertionError msg)
    and refute' msg value = assert' msg (not value)
  in
    val assert = assert' "expected true, got false"

    fun assertEqual a b = assert' "parameters differ" (a = b)

    fun assertNone value = assert' "expected none" (value = NONE)

    fun assertRaise exc f =
      let
        val status = (f (); false) handle exc => true
      in
        assert' "exception not raised" status
      end

    val refute = refute' "expected false, got true"

    fun refuteEqual a b = refute' "parameters equal" (a = b)

    fun refuteNone value = refute' "expected not none" (value = NONE)
  end
end
