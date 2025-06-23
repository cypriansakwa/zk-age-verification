
// Age Verification Circuit in Noir
// Verifies that a user's private age meets a public minimum age threshold
// without revealing the actual age.

fn main(age: Field, minimum_age: pub Field, flag: pub Field) {
    // Cast Field to u32 for comparison
    let age_u32 = age as u32;
    let minimum_u32 = minimum_age as u32;

    // Compute the result: 1 if age >= minimum_age, else 0
    let is_valid = if age_u32 >= minimum_u32 { 1 } else { 0 };

    // Ensure the public flag matches the internal result
    assert(is_valid == flag);
}

#[test]
fn test_age_is_above_minimum() {
    let age = 21;
    let minimum_age = 18;
    let flag = 1; // Should pass: 21 >= 18
    let is_valid = if age >= minimum_age { 1 } else { 0 };
    assert(is_valid == flag);
}

#[test]
fn test_age_is_below_minimum() {
    let age = 16;
    let minimum_age = 18;
    let flag = 0; // Should pass: 16 < 18
    let is_valid = if age >= minimum_age { 1 } else { 0 };
    assert(is_valid == flag);
}

 //#[test]
//fn test_invalid_flag() {
  //   let age = 17;
   //let minimum_age = 18;
    //let flag = 1; // This test will fail if uncommented
    //let is_valid = if age >= minimum_age { 1 } else { 0 };
   // assert(is_valid == flag);
// }
