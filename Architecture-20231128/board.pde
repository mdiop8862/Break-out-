enum TypeCell
{
  EMPTY, WALL, DESTRUCTIBLE_WALL, EXIT_DOOR, MONSTER, BOMBERMAN
}

class Board
{
  TypeCell _cells[][];
  PVector _drawPosition;
  PVector _drawSize;
  int _nbCellsX;
  int _nbCellsY;
  int _cellSize; // cells should be square
  int spriteX;
  int spriteY;
  int spriteSize;
  PImage atlas1;
  PImage atlas2;
  PImage [] spriteListe;
  Board(PVector drawPosition, PVector drawSize, int nbCellsX, int nbCellsY) {
    _drawPosition=drawPosition;
    _drawSize=drawSize;
    _nbCellsX=nbCellsX;
    _nbCellsY=nbCellsY;
    _cells=new TypeCell[_nbCellsX][_nbCellsY];
    _cellSize=int(Math.min(_drawSize.x, _drawSize.y)/_nbCellsX);
    atlas1 = loadImage("data/img/tiles.png");
    atlas2 = loadImage("data/img/characters.png");
  }
  void chargerPlateauEnDure() {

    for (int i=0; i<_nbCellsX; i++) {
      for (int j=0; j<_nbCellsY; j++) {
        _cells[i][j]=TypeCell.EMPTY;
      }
    }
  }

  void chargerPlateauFichier(String file) {
    String[] lines = loadStrings(file);
    int nbLines = lines.length;
    int nbColumns =  lines[1].length();
    _cells = new TypeCell[nbColumns][nbLines-1];

    for (int i=1; i<nbLines; i++) {
      String line = lines[i];
      for (int j=0; j<nbColumns; j++) {
        char symbol = line.charAt(j);
        _cells[j][i-1]=convertSymbolCellType(symbol);
      }
    }
  }

  TypeCell convertSymbolCellType(char symbole) {
    switch (symbole) {
    case 'v':
      return TypeCell.EMPTY;
    case 'x':
      return TypeCell.WALL;
    case 'o':
      return TypeCell.DESTRUCTIBLE_WALL;
    case 'S':
      return TypeCell.EXIT_DOOR;
    case 'M':
      return TypeCell.MONSTER;
    case 'B':
      return TypeCell.BOMBERMAN;
    default :
      return TypeCell.EMPTY;
    }
  }

  void savePlateau(String file) {
    String[] lines=new String[_nbCellsY];
    for (int i=0; i<lines.length; i++) {
      StringBuilder line = new StringBuilder();
      for (int j=0; j<lines[i].length(); j++) {
        char symbole = convertTypeCellSymbole(_cells[i][j]);
        line.append(symbole);
      }
      lines[i]=line.toString();
    }
    saveStrings(file, lines);
  }
  char convertTypeCellSymbole(TypeCell cell) {
    switch (cell) {
    case  EMPTY :
      return 'v';

    case  WALL :
      return 'x';

    case  DESTRUCTIBLE_WALL :
      return 'o';

    case  EXIT_DOOR :
      return 'S';

    case  MONSTER :
      return 'M';

    case  BOMBERMAN :
      return 'B';
    default:
      return 'v';
    }
  }

  PVector getCellCenter(int i, int j) {

    spriteX=i*_cellSize+_cellSize/2;
    spriteY=j*_cellSize+_cellSize/2;
    return new PVector(spriteX, spriteY) ;
  }

  PImage getsprite(int i, int j) {
    int sizeSprite=16;
    float spriteX=i * sizeSprite;
    float spriteY=j * sizeSprite;
    PImage sprite=atlas1.get(int(spriteX), int(spriteY), sizeSprite, sizeSprite);
    return sprite;
  }

  PImage getsprite(PImage atlas, int i, int j, int sizeSpriteY) {
    int sizeSpriteX=16;
    float spriteX=i * sizeSpriteX;
    float spriteY=j * sizeSpriteY
      ;
    PImage sprite=atlas.get(int(spriteX), int(spriteY), sizeSpriteX, sizeSpriteY);
    return sprite;
  }
  
  boolean isEmpty(int cellX, int cellY){
    return _cells[cellX][cellY] == TypeCell.EMPTY;
  }

  void fillList() {
    spriteListe=new PImage[]{
      getsprite(atlas1, 3, 5, 16),
      getsprite(atlas1, 5, 6, 16),
      getsprite(atlas1, 5, 5, 16),
      getsprite(atlas1, 8, 3, 16),
      getsprite(atlas1, 2, 7, 16),
      getsprite(atlas1, 5, 3, 16),
      getsprite(atlas1, 3, 5, 16),
      //getsprite(atlas2, 0, 3, 24),
      //getsprite(atlas2, 1, 0, 24),
      getsprite(atlas1, 6, 6, 16),
      getsprite(atlas1, 5, 1, 16),
      getsprite(atlas1, 5, 0, 16),
      getsprite(atlas1, 0, 1, 16),
      getsprite(atlas1, 0, 0, 16),
    };
  }

  void drawIt() {
    for (int i=0; i<_nbCellsX; i++) {
      for (int j=0; j<_nbCellsY; j++) {

        PVector Cellsprite = getCellCenter(i, j);
        PImage sprite;
        switch(_cells[i][j]) {
        case EMPTY :
          fill(0, 255, 255);
          sprite=spriteListe[0];
          break;
        case WALL:
          fill(255);
          sprite=spriteListe[1];
          break;
        case DESTRUCTIBLE_WALL:
          fill(157);
          sprite=spriteListe[2];
          break;
        case EXIT_DOOR:
          fill(90);
          sprite=spriteListe[3];
          break;
        default:
          fill(0, 255, 255);
          sprite=spriteListe[0];
          break;
        }
        image(sprite, Cellsprite.x+ _drawPosition.x, Cellsprite.y+_drawPosition.y,_cellSize, _cellSize);
      }
    }
  }
}
