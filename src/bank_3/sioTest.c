// #include <gb/gb.h>
// #include <stdio.h>

// #pragma bank 3

// unsigned int varInt = 61455;
// unsigned char varChar[2];
// unsigned int pairedInt;

// BANKREF(sioTest)
// void sioTest() BANKED
// {
//     //printf("A: Send\nB: Receive\n\n");

// 	pairedInt = 0;

// 	// 8 leftmost bits (8 - 15)
// 	varChar[0] = (unsigned char) (varInt >> 8);
// 	// 8 rightmost bits (0 - 7)
// 	varChar[1] = (unsigned char) (varInt);

// 	while (1) {
// 		if (joypad() == J_A)
// 		{
// 			waitpadup();

// 			for(unsigned char i = 0; i < 2; i++)
// 			{
// 				_io_out = varChar[i];

// 				// send _io_out
// 				send_byte(); 

// 				//printf("Sending...\n");
// 				// Wait for Send
// 				while (_io_status == IO_SENDING);

// 				// If SENT
// 				if(_io_status == IO_IDLE)
// 				{
// 					switch(i)
// 					{
// 						case 0:
// 							// convert to uint then bitshift left x 8
// 							pairedInt = ((unsigned int) varChar[i]) << 8;
// 							break;
// 						case 1:
// 							// convert to uint then add to prior converted byte
// 							pairedInt += ((unsigned int) varChar[i]);
// 							break;
// 						default:
// 							// if neither of those, then an error occurred
// 							//printf("Error\n");
// 							break;
// 					}
// 					//printf("Sent %u\n", pairedInt);
// 				}
// 				// Else print error code
// 				else
// 				{
// 					//printf("Error\n");
// 				} 
// 			}

// 		}

// 		if (joypad() == J_B)
// 		{
// 			waitpadup();

// 			for(unsigned char i = 0; i < 2; i++)
// 			{
// 				// receive _io_in
// 				receive_byte(); 

// 				//printf("Receiving...\n");
// 				// Wait for Receive
// 				while (_io_status == IO_RECEIVING);

// 				// If RECEIVED
// 				if(_io_status == IO_IDLE)
// 				{
// 					switch(i)
// 					{
// 						case 0:
// 							// convert to uint then bitshift left x 8
// 							pairedInt = ((unsigned int) varChar[i]) << 8;
// 							break;
// 						case 1:
// 							// convert to uint then add to prior converted byte
// 							pairedInt += ((unsigned int) varChar[i]);
// 							break;
// 						default:
// 							// if neither of those, then an error occurred
// 							//printf("Error\n");
// 							break;
// 					}
// 					//printf("Received %u\n", pairedInt);
// 				}
// 				// Else print error
// 				else
// 				{
// 					//printf("Error\n");
// 				}
// 			}
// 		}
// 	}
// }