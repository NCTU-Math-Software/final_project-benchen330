# final_project-benchen330
final_project-benchen330 created by GitHub Classroom

chebsnake, shooting, 踩地雷

完成了踩地雷, mine.m, tiles.jpg(網上的踩地雷格子圖)

mine(N,bn); N代表幾乘幾格，bn代表炸彈數

玩法:

    左鍵:1.點開格子
        
         2.如果是點開過的且周圍插旗樹等於周圍炸彈數，把周圍還沒點開的地方點開
    
    右鍵:插旗拔旗(不能點太快，ginput()有時會讀成左鍵)
    
    滾輪:可以直接中斷遊戲
  
結束條件:

    1.點到炸彈
    
    2.非炸彈格都點完
  
內容:

    background是遊玩畫面
    
    backinfo儲存每一格的狀態
    
        -1 炸彈
        
         0 沒點過
         
         1 點過
         
         2 旗子
         
         3 炸彈旗
    
    
    
    
        
    
  
  
  
