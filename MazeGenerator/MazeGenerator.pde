import java.util.*;

Stack<Cell> stack;

int rows = 0, columns = 0;
int size = 20;
public ArrayList<Cell> cells;
Cell current,next;

void setup(){

  size(1000,1000,P3D);
  //frameRate(10);
  
  cells = new ArrayList<Cell>();
  stack = new Stack<Cell>();
  rows = height/size;
  columns = width/size;
  int id = 0;
  
  for(int i= 0; i< rows; i++){
    for(int j = 0; j< columns ; j++){
        print(id+" ");
        cells.add(new Cell(j,i,size,id));
        id += 1;
        }
        println("  ");
    }
  current = cells.get(0);

  background(0);
}

void draw(){
  background(0);
  for(int i = 0;i< cells.size();i++){
    Cell cell = cells.get(i);
    cell.display();
  }

  current.visited = true;
  next = current.checkNeighbours(cells);
  
  
  if(next!=null){
    next.visited = true;

    // step 2
    stack.push(current);

    //step 3
    removeWalls(current,next);

    // step 4
    current = next;
  }
  else if(!stack.empty()){
    current = stack.pop();
  }
    highlight(current);
  }

void removeWalls(Cell a, Cell b){
  int x = a.i - b.i;
  
  if(x==1){
    a.walls[3] = false;
    b.walls[1] = false;
  }
  else if(x== -1){
    a.walls[1] = false;
    b.walls[3] = false;
  }
  
  int y = a.j - b.j;
  if(y==1){
    a.walls[0] = false;
    b.walls[2] = false;
  }
  else if(y== -1){
    a.walls[2] = false;
    b.walls[0] = false;
  }
}


void highlight(Cell c){
  
  fill(255,0,0);
  rect(c.position.x,c.position.y,size,size);

}
