class Menu{
  color backgroundColor ;
  String Name ;
  int titleX ;
  int titleY ;
  //constructeur 
  Menu (color backgroundColor , String Name , int titleX , int titleY){
    this.backgroundColor = backgroundColor ; 
    this.Name = Name  ;
    this.titleX = titleX ; 
    this.titleY = titleY ;
    
  }
  
  void initialise(){
    background(this.backgroundColor) ;
    
  }
  
  void AfficheGameName(){
    PFont maPolice = createFont("AlumniSansInlineOne-Italic.ttf" , 32 ) ;
    textSize(100) ;
    textFont(maPolice) ;
    textAlign(CENTER) ;
    text(this.Name , this.titleX , this.titleY ) ;
  }
}
