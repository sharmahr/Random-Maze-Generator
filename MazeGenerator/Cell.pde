

class Cell{
  // top, right , bottom , left
  
  PVector position;
    int id = 0;
    int i, j;
    int size =0;
    boolean[] walls = {true, true, true, true}; // top right bottom left
    boolean visited = false;


  Cell(int x, int y, int size, int id){
    i = x;
    j = y;
    position = new PVector(x*size,y*size);
    this.size = size;
    this.id = id;
  }
  
  
  
  int index(int i,int j){
   if(i<0 || j<0 || i>rows-1 || j>columns-1){
     return -1;
     }
    return i+ j*columns;
  }
  

  Cell checkNeighbours(ArrayList<Cell> grid){
    Cell top, right, bottom , left;
    ArrayList<Cell> neighbours = new ArrayList<Cell>();

    //  top neighbour added to ArrayList
    if(index(i,j-1)!= -1){
      top = grid.get(index(i,j-1));
    }
    else{
      top = null;
    }


    // right neighbour added to ArrayList
    if(index(i + 1,j)!= -1){
      right = grid.get(index(i + 1,j));
    }
    else{
      right = null;
    }


    // bottom neighbour added to ArrayList
    if(index(i,j+1)!= -1){
      bottom = grid.get(index(i,j+1));
    }
    else{
      bottom = null;
    }

    
    // left neighbour added to ArrayList
    if(index(i-1,j)!= -1){
      left = grid.get(index(i-1,j));
    }
    else{
      left = null;
    }

    if( top!=null && !top.visited){
      neighbours.add(top);
      println("top added "+this.id);
    }
    if(right!= null && !right.visited){
      neighbours.add(right);
      println("right added "+this.id);
    }
    if(bottom!= null && !bottom.visited){
      neighbours.add(bottom);
      println("bottom added "+this.id);
    }
    if(left!= null && !left.visited){
      neighbours.add(left);
      println("left added "+this.id);
    }
    if(neighbours.size() > 0){
      return neighbours.get(int(random(0,neighbours.size())));
    }
    else{
    return null;
  }
  }  
  
  
  void display(){
    stroke(255);

    if(walls[0]){
      line(position.x,position.y,position.x+size,position.y);
    }
    if(walls[1]){
      line(position.x + size,position.y,position.x+size,position.y + size);
    }
    if(walls[2]){
      line(position.x + size,position.y + size,position.x,position.y + size);
    }
    if(walls[3]){
      line(position.x,position.y + size,position.x,position.y);
    }
    
    noStroke();
    fill(255, 34,255,100);
    if(visited){
      rect(position.x, position.y,size,size);
    }
  }
}  
