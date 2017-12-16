//+------------------------------------------------------------------+
//|                                             MYfirstEAexample.mq4 |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"
#property strict


//Parameters
input int Magic = 123465;
input double Lots = 0.1;
input int Slippage = 2;
input string OrdersComment = "ZeroCreate";
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
      OrderSend(Symbol(),OP_BUY,Lots,Ask,Slippage,0,0,OrdersComment,Magic,0,clrBlue);
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
