player.list<-list(a=10,b=10,d=10,e=10) #'c' is a reserved function.
playerplayers[[1]]
sample(players,2)

count<-0
flip.coin<-function(probability=.5){rbinom(1,1,prob=probability)} #simple random binomial choice of 1 or zero, 1 times
bet<-function(bets=5){
    count<-0
    for(i in 1:bets){
      if(a>0 & b>0){
        count<-count+1
        flip.outcome<-flip.coin()
        #print(paste('the flip number',i,'is',flip.outcome))
        ifelse(flip.outcome==1,a<<-a+1,a<<-a-1) #if heads, player a adds 1, if not, loses 1
        ifelse(flip.outcome==1,b<<-b-1,b<<-b+1) #if heads player b loses 1, so on

      }
      else{
        print('a player has no more coins to bet; game over')
#        print(paste("player \'a\' now has",a,"coins")) #final tally
 #       print(paste("player \'b\' now has",b,"coins")) #final tally
        count<<-count
#        print(paste ("there were",count,"coin flips"))
 #       print(paste("player \'a\' now has",a,"coins"))
  #      print(paste("player \'b\' now has",b,"coins"))
        return(count)
      }
    
  }      
  #print(paste("player \'a\' now has",a,"coins")) #final tally
  #print(paste("player \'b\' now has",b,"coins")) #final tally
  #print(paste ("there were",count,"coin flips"))
}

bet(40)


game<-function(rounds=2,flips=10){
    #players<-sample(players,2)
  for(i in 1:rounds){
    if(a==0 | b==0){
      print('A player has joined the proletariat.')
      #break("not enough coins")
      return(print(paste("the number of flips this last round was: ",count)))
    }else{
      cat("\nRound",i,"begins!!!\n")
      cat('player a', 'begins with ',a, 'coins\n')
      cat('player b', 'begins with ',b, 'coins\n')
      count<<-bet(flips)
    }
   } 
  }

a<-5
b<-15
game(rounds=6,flips=10)

  #only works for a few players.Need to generalize. Change the above 
#"a<-a+1,a<-a-1" "player<-player+1,player<-player-1" and the other to opponent?  

player_list<-list(letters[1:5])
player_coins<-list(rep(10,5))
players_n_coins<-list(player_list=player_list,player_coins=player_coins)
players_n_coins[[1]]


https://bims.fun/r-lists.html#indexing_lists



gamers<-sample(player.list,2)

bet<-function(bets=5,gamers=gamers){
  count<-0
  for(i in 1:bets){
    if(gamers[1]>0 & gamers[2]>0){
      count<-count+1
      flip.outcome<-flip.coin()
      #print(paste('the flip number',i,'is',flip.outcome))
      ifelse(flip.outcome==1,gamers[[1]]<<-gamers[[1]]+1,gamers[[1]]<<-gamers[[1]]-1) #if heads, player a adds 1, if not, loses 1
      ifelse(flip.outcome==1,gamers[[2]]<<-gamers[[2]]-1,gamers[[2]]<<-gamers[[2]]+1) #if heads player b loses 1, so on
      
    }
    else{
      print('a player has no more coins to bet; game over')
      #        print(paste("player \'a\' now has",a,"coins")) #final tally
      #       print(paste("player \'b\' now has",b,"coins")) #final tally
      count<<-count
      #        print(paste ("there were",count,"coin flips"))
      #       print(paste("player \'a\' now has",a,"coins"))
      #      print(paste("player \'b\' now has",b,"coins"))
      return(count)
    }
    
  }      
  #print(paste("player \'a\' now has",a,"coins")) #final tally
  #print(paste("player \'b\' now has",b,"coins")) #final tally
  #print(paste ("there were",count,"coin flips"))
}

bet(1)
