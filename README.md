# 踩地雷

如何跑程式:

    1.下載mine.m和tiles.jpg

    2.mine(N,bn); //N代表N乘N格，bn代表炸彈數

玩法:

    左鍵:1.點開格子
        
         2.如果是點開過的且周圍插旗數等於周圍炸彈數(格子顯示的數字)，把周圍還沒點開的地方點開
    
    右鍵:插旗拔旗(不能點太快，ginput()有時會讀成左鍵)
    
    滾輪:可以直接中斷遊戲
  
結束條件:

    1.點到炸彈(lose)
    
    2.非炸彈格都點完(win)
  
程式內容:

    background是遊玩畫面

    backinfo儲存每一格的狀態
    
        -1 炸彈
        
         0 沒點過
         
         1 點過
         
         2 旗子
         
         3 炸彈旗

    具體流程大概就是:
        
        1.點擊畫面，接收位置和按鍵
        
        2.由按鍵決定要做什麼事(ex.點開，插旗或結束)
        
        3.由位置的backinfo決定要對這個位置進行什麼變動
        
        4.將改變的background顯示
        
        5.回到1.
        
    Extra:
    
        1.點開的第一個不會是炸彈
        
        2.第一次點開一定是空格(周圍沒炸彈)，除非 格子數-炸彈數 < 9
        
        3.如果點開的是空格，直接把周圍的格子也點開(遞迴，這周圍有空格也做這件事)
        
        4.左鍵點到點開過的格子且周圍插旗數等於周圍炸彈數(格子顯示的數字)，把周圍還沒點開的格子點開(這裡點開的也會做3.)
    
  
  
  
