val () =
  describe "UnitTest TestCase" (fn () =>
    ( describe "assert tests" (fn () =>
      ( it "should succeed for assert true" (fn () => assert true)

      ; it "should succeed for assertEqual" (fn () =>
        ( assertEqual 0 0
        ; assertEqual "a" "a"
        ; assertEqual () ()
        )
      )

      ; it "should fail for assert false" (fn () =>
        assertRaise (AssertionError "") (fn () => assert false)
      )

      ; it "should fail for assertEqual" (fn () =>
        ( assertRaise (AssertionError "") (fn () => assertEqual 0 2)
        ; assertRaise (AssertionError "") (fn () => assertEqual "a" "v")
        ; assertRaise (AssertionError "") (fn () => assertEqual {x = 3} {x = 4})
        )
      ))
    )

    ; describe "refute tests" (fn () =>
      ( it "should succeed for refute false" (fn () => refute false)

      ; it "should succeed for refuteEqual" (fn () =>
        (refuteEqual 0 1
        ; refuteEqual "a" "ab"
        ; refuteEqual {x = 3} {x = 4}
      ))

      ; it "should fail for refute true" (fn () =>
        assertRaise (AssertionError "") (fn () => refute true)
      )

      ; it "should fail for refuteEqual" (fn () =>
        ( assertRaise (AssertionError "") (fn () => refuteEqual 0 0)
        ; assertRaise (AssertionError "") (fn () => refuteEqual "a" "a")
        ; assertRaise (AssertionError "") (fn () => refuteEqual {x = 3} {x = 3})
        ))
      )
    )
  ))
