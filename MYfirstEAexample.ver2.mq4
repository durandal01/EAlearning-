//+------------------------------------------------------------------+
//|                                             MYfirstEAexample.mq4 |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"
#property strict


extern double Lots = 0.1;

input int StartHour = 9;
input int StopHour = 18;
 

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  
  {
   if(Hour() == StartHour && OrdersTotal() == 0)
   {
      OrderSend(Symbol(),OP_BUY,Lots,Ask,2,0,0,"",123456,0,clrBlue);
   }
    
   if(Hour() == StopHour && OrdersTotal() > 0)
   {
      for(int i=0; i<=OrdersTotal()-1; i++)
      {
          if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES) == false) break;
          OrderClose(OrderTicket(),OrderLots(),Bid,2,clrBlue);
      }
   }
  }
  
  
  
  
  
  
  
  
//+------------------------------------------------------------------+
