create_players<-function(players=4){
  player.names<-letters[1:players]
  player.list<-list()
  for(i in 1:players){
    player.list[i]<-list(list(coin=10,round=0))
  }
  names(player.list)<-player.names
  return(player.list)
}
player.list<-create_players(22)
count<-0
flip.coin<-function(probability=.5){rbinom(1,1,prob=probability)} #simple random binomial choice of 1 or zero, 1 times
bet<-function(bets=5,player1,player2){
    count<-0
    for(i in 1:bets){
      if(player1$coin>0 & player2$coin>0){
        count<-count+1
        flip.outcome<-flip.coin()
        #print(paste('the flip number',i,'is',flip.outcome))
        ifelse(flip.outcome==1,player1$coin<-player1$coin+1,player1$coin<-player1$coin-1) #if heads, player a adds 1, if not, loses 1
        ifelse(flip.outcome==1,player2$coin<-player2$coin-1,player2$coin<-player2$coin+1) #if heads player b loses 1, so on
        

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
      print(player2$coin)
      
  }      
    print(player2)
  #print(paste("player \'a\' now has",a,"coins")) #final tally
  #print(paste("player \'b\' now has",b,"coins")) #final tally
  #print(paste ("there were",count,"coin flips"))
}

bet(40,player1=player.list$a,player2=player.list$b)
#this above works as far as making an interal list item.  But my problems:
#1 how to keep track of the actual player name in the function.  If I feed it player$a how do I backtrack to player a
#2 must then right a search function to crawl the player list looking for the right player to add coins to

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

player.list<-list(a=10,b=11, d=12, e=13)
player.list[]
#player.count<-length(player.list)
bet<-function(flips=2){
  player.count<-length(player.list)
  players<-sample(1:player.count,2,replace=F)
  print(paste("there are this number if players",player.count))
  print(players)
  print("the above shoukd be two numbers bw 1&4")
  print(paste("there shkukd be this many flips",flips))
  
  for (i in 1:flips){
    #print(i)
    player.list[players[1]][[1]]<<-player.list[players[1]][[1]] +1
  }
}

bet(15)
player.list#[2][[1]]+1

bet(15)
bet(15)
bet(15)
bet(15)
player.list#[2][[1]]+1

