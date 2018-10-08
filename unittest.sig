signature UNIT_TEST =
sig
  val assert        : bool -> unit
  val assertEqual   : ''a -> ''a -> unit
  val assertRaise   : exn -> (unit -> unit) -> unit
  val refute        : bool -> unit
  val refuteEqual   : ''a -> ''a -> unit
end
