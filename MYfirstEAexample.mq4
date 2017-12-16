//+------------------------------------------------------------------+
//|                                             MYfirstEAexample.mq4 |
//|                                                                  |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright ""
#property link      ""
#property version   "1.00"
#property strict
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
   if(Hour() == 9 && OrdersTotal() == 0)
   {
      OrderSend(Symbol(),OP_BUY,0.1,Ask,2,0,0,"",123456,0,clrBlue);
   }
    
   if(Hour() == 18 && OrdersTotal() > 0)
   {
      for(int i=0; i<=OrdersTotal()-1; i++)
      {
          if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES) == false) break;
          OrderClose(OrderTicket(),OrderLots(),Bid,2,clrBlue);
      }
   }
  }
  
  
  
  
  
  
  
  
//+------------------------------------------------------------------+
