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


//returning a console.log error
filterFn(dir, filterStr, function (err, list) {
  if (err)
    return console.error('There was an error:', err)

  list.forEach(function (file) {
    console.log(file)
  })
})
