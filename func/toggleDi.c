void toggleDi(){
	switch(cursorIndex){
		case 3:
			if(Di1.inPlay == 1){
				Di1.inPlay = 0;
				moveDiceStruct(&Di1, Di1.x, heldPosY);
			}
			else if(Di1.inPlay == 0){
				Di1.inPlay = 1;
				moveDiceStruct(&Di1, Di1.x, rollPosY);
			}
			break;
		case 4:
			if(Di2.inPlay == 1){
				Di2.inPlay = 0;
				moveDiceStruct(&Di2, Di2.x, heldPosY);
			}
			else if(Di2.inPlay == 0){
				Di2.inPlay = 1;
				moveDiceStruct(&Di2, Di2.x, rollPosY);
			}
			break;
		case 5:
			if(Di3.inPlay == 1){
				Di3.inPlay = 0;
				moveDiceStruct(&Di3, Di3.x, heldPosY);
			}
			else if(Di3.inPlay == 0){
				Di3.inPlay = 1;
				moveDiceStruct(&Di3, Di3.x, rollPosY);
			}
			break;
		case 6:
			if(Di4.inPlay == 1){
				Di4.inPlay = 0;
				moveDiceStruct(&Di4, Di4.x, heldPosY);
			}
			else if(Di4.inPlay == 0){
				Di4.inPlay = 1;
				moveDiceStruct(&Di4, Di4.x, rollPosY);
			}
			break;
		case 7:
			if(Di5.inPlay == 1){
				Di5.inPlay = 0;
				moveDiceStruct(&Di5, Di5.x, heldPosY);
			}
			else if(Di5.inPlay == 0){
				Di5.inPlay = 1;
				moveDiceStruct(&Di5, Di5.x, rollPosY);
			}
			break;
	}
}
