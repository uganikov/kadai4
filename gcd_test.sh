#/bin/bash

totalcase=0
failedcase=0

function testcase(){
  let totalcase=$totalcase+1
  cmdline=$1
  output=$2
  retcode=$3
  o=`$cmdline`
  r=$?
  if [ "x$output" != "x$o" -o $retcode -ne $r ]; then
    echo "testcase \"$cmdline\" failed"
    echo "expected result: output: "$output", return code: $retcode"
    echo "actual   result: output: "$o", return code: $r"
    echo
    let failedcase=$failedcase+1
  fi
}

testcase "./gcd.sh 2 4" "2" 0
testcase "./gcd.sh 3" "./gcd.sh num1 num2" 1
testcase "./gcd.sh a b" "./gcd.sh num1 num2" 1

echo "total: $totalcase, failed: $failedcase, pass rate: $(((($totalcase-$failedcase)*100)/$totalcase))%"

if [ $failedcase -ne 0 ]; then
  exit 1
fi
