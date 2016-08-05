PerfLog = function()
{
  this.data = [];
  this.totalFrames = 0;
  this.dataFrames = 0;
  this.debug = true;
}

PerfLog.prototype.addLog = function(oLog) {
  this.data.push(oLog);  
  
  if (this.debug) {
    for (i in oLog) {
      console.log("perflog -- "+i+": "+oLog[i]);
    }
    console.log("---------");
  }
}

PerfLog.prototype.countTriangles = function(scene) {
  var total = 0;
  
  for (var i = 0, iMax = scene.sceneObjects.length; i < iMax; i++) {
    if (scene.sceneObjects[i].obj) {
      total += scene.sceneObjects[i].obj.faces.length;
    }
  }
  
  return total;
}