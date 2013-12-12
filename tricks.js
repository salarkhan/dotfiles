//sleep without setTimeout. genius.
function start(){
  console.log("i'm about to sleep yo")

  function sleep(milliSeconds){
    var startTime = new Date().getTime();
    while (new Date().getTime() < startTime + milliSeconds){}
  }
sleep(10000)
return ("i'm up!")
}
