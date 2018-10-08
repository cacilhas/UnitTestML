val () =
  describe "UnitTest TestCase" (fn () => (
    describe "assert tests" (fn () => (
      it "should succeed for assert true" (fn () =>
        assert true
      );

      it "should succeed for assert_equal" (fn () => (
        assert_equal 0 0;
        assert_equal "a" "a";
        assert_equal () ();
      ));

      it "should fail for assert false" (fn () =>
        assert_raise (AssertionError "") (fn () => assert false)
      );

      it "should fail for assert_equal" (fn () => (
        assert_raise (AssertionError "") (fn () => assert_equal 0 2);
        assert_raise (AssertionError "") (fn () => assert_equal "a" "v");
        assert_raise (AssertionError "") (fn () => assert_equal {x=3} {x=4});
      ));
    ));

    describe "refute tests" (fn () => (
      it "should succeed for refute false" (fn () =>
        refute false
      );

      it "should succeed for refute_equal" (fn () => (
        refute_equal 0 1;
        refute_equal "a" "ab";
        refute_equal {x=3} {x=4};
      ));

      it "should fail for refute true" (fn () =>
        assert_raise (AssertionError "") (fn () => refute true)
      );

      it "should fail for refute_equal" (fn () => (
        assert_raise (AssertionError "") (fn () => refute_equal 0 0);
        assert_raise (AssertionError "") (fn () => refute_equal "a" "a");
        assert_raise (AssertionError "") (fn () => refute_equal {x=3} {x=3});
      ));
    ));
  ))
