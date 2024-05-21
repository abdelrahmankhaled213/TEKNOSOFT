bool checkState(bool state,int index1) {
  if(index1>0) {
    state = true;
  }
  else {
    state = false;
  }
return state;
}

String checkText(int index,String text) {
  if(index==2){
    text="Get Started";
  }
  else{
    text="Next";
  }
  return text;
}