signature UNIT_TEST =
sig
  val assert         : bool -> unit
  val assert_equal   : ''a -> ''a -> unit
  val assert_raise   : exn -> (unit -> unit) -> unit
  val refute         : bool -> unit
  val refute_equal   : ''a -> ''a -> unit
end
