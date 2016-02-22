private double fractionLength = .8; 
private int smallestBranch = 10; 
public double branchAngle = 0.5;  
public void setup() 
{   
	size(640,480);    
	noLoop(); 
} 
public void draw() 
{   
	background(0);   
	stroke((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));   
	line(320,480,320,380);   
	drawBranches(320, 380, 100, 3+Math.PI/2);
} 
public void mouseDragged() 
{
	if(width/2 < mouseX) {
		branchAngle+=0.1;
		redraw();
	}
	else { 
		branchAngle-=0.1;
		redraw();
	}
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
	//your code here    
	double angle1 = angle + branchAngle, angle2 = angle - branchAngle;
	branchLength*=fractionLength;
	int endX1=(int)(branchLength*Math.cos(angle1) + x), 
		endY1=(int)(branchLength*Math.sin(angle1) + y), 
		endX2=(int)(branchLength*Math.cos(angle2) + x), 
		endY2=(int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	if (branchLength > smallestBranch) {
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
	}
} 
