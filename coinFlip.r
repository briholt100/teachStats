b<-10^seq(1,5,len=1000) #creates a 1000 simulations ranging frmo 10^1 to 10^5


#flip is a funciton that takes two parameters, b and x, which are the number of simulations and the probablity of the coin with a default of .5, also known as 50/50
flip <-function(b,x=.5){
  sapply(b,                   #lapply takes a vector and then applies a function with that vector
         function(b) mean(rbinom(b,1,x)))  #rbinom is a base R function that randonly generates values based on the binomial forumla
}

plot(log10(b),flip(b,.5),type='l',col='blue',ylim = c(.3,.8))  #plot will create a graph with log10(b) as the x axes and then pots the result of the flip() function above
lines(log10(b),flip(b,.55),type='l',col='red')  #lines is like plot, but instead of creating a new plot, it overlays over top of the current plot

flip_list<-flip(b,.5)

plot(flip_list[1:999]-flip_list[2:1000])
abline(h=.01, col='red')


fair_coin<-flip(b,.5)
unfair_coin<-flip(b,.6)
df<-data.frame(fair_coin,unfair_coin)
library(ggplot2)
p<-ggplot(data=df,aes(x=log10(b),y=fair_coin))+geom_line() #makes first graph, saves to 'p'

p+ geom_line(aes(x=log10(b),y=unfair_coin,col='red')) #adds new graph to 'p'





rbinom(10,10,.5) # 10 is the number of observations while '1' is the number of trials. So, if this were 10 as well, there would a sum of 'successes' that were less than 10
dbinom(3,10,.5)  # this determines the density,  aka probability of exact outcome, so x= 3 heads out of 10, is not the cumulative 0-3 but exactly 3 for example. for cumulative, use pbinom, or sum dbinom:
sum(dbinom(3,10,.5),dbinom(2,10,.5),dbinom(1,10,.5),dbinom(0,10,.5))
pbinom(3,10,.5)




#coin_flip() does the flipping, two styles, by thumb is standard

coin_flip<-function(type = .5, bias = .1){
  rbinom(1,1,type+bias)
}
mean(replicate(100,coin_flip()))

#coin will be either unbiased or biased.

Bag_of_coins<- c(rep(.5,9),.6) #lists 9 fair coins, one biased coin at .6
sample<-sample(Bag_of_coins,5,replace = F) #picks 5 coins randomly from bag
coin_flip(type=sample,bias=0)


#expected value
x<-c(1,2,3,4,5,6) # single dice
probability<-(c(rep(1/7,5),.2857143)) #probabilty that the dice is loaded for 6
  hist(replicate(1000,sample(x,1,replace = T,prob=probability)))


  x<-c(0,1) # single coin, 0=Tails
  probability<-c(.5,.5) #probabilty that the coin is fair = .5
  mean(replicate(1000,sample(x,1,replace = T,prob=probability)))

#simulation game




  #flip game
  #establish players, beginning money
  Player_class<-function(s,p){
    value<-list("stash"=s,"player_name"=p)
      attr(value, "class") <- "player"
    value}

  flip<-function(obj){
      UseMethod("flip")
  }

  flip.default<-function(obj,p=.5){
    value<-rbinom(1,1,p)
    value
  }

  flip.player<-function(obj,p=.5){
    value<-rbinom(1,1,p)
    value
  }

  p1<-Player_class(10,'p1')
  p2<-Player_class(10,'p2')

  flip(p1)  #this is a method, a function, called for player1 'p1' where rbinom produces a coint toss
  #questions: how to modify probablity from default of .5?
  #

  n<-2  #number of players

  for (i in 1:n){print(i)}



  p1<-10;p2<-10
  #player_stash <- 10
  # 1.
  bet_options<-c(1,2,3)
  bet<-sample(bet_options,1)

  #4 determine winner or loser
  #     person who flips calls h/t
  call_coin<-sample(c(1,0),1)
  ifelse(call_coin==1,print("I call heads"),print("I call tails"))


  #flip coin
      flip<-rbinom(1,1,.5)
      ifelse(flip==1,print("Heads"),print("Tails"))
  if(call_coin - flip==0){
    p1<-p1+bet
    p2<-p2-bet
    }else{
       p1<-p1-bet
       p2<-p2+bet}

  # if call - flip  != 0 then non caller wins
  # winner has their stash += bet
  # loser has tehir stash reduced -= bet



  #sample from















################
      #object oriented Programming#
library(R6)

      Player<-R6Class("Player",
                      public = list(
                        name = NULL,
                        stash = NULL,
                        betting_style = NULL,
                        initialize = function(name = NA, stash = NA, betting_style = 2) {
                          self$name <- name  #these functions will be called upon intitializing new objects
                          self$stash <- stash
                          self$betting_style<-betting_style
                          self$greet()
                          },
                        set_stash = function(val) {
                          self$stash <- val
                        },
                        greet = function() {
                          cat(paste0("Hello, my name is ", self$name, ".\n\n\n"))
                          cat(paste0("My stash of chips is ", self$stash, ".\n\n\n"))
                          cat(paste0("My style of betting is ", self$betting_style, ".\n\n\n"))
                        },
                        call_coin = function(){
                          call<-ifelse(sample(c(1,0),1)==1,'Heads!','Tails!')
                          cat(paste0("I call ",call,"\n\n\n"))
                        },
                        flip_coin = function(){
                          #validate that bet of 'heads or tails' has occured
                          #if (call)
                            flip<-rbinom(1,1,.5)
                          ifelse(flip==1,flip<-"Heads",flip<-"Tails")
                          flip
                        }#,
                        #make_bet<-function(player){
                        #  call_coin()

                        #  }

                      )
      )
p1<-Player$new("Brian",10,3)
p2<-Player$new("Julie",10)

# the following game should take 2 players and let them flip a coin after call heads/tails.
# Two mirror a real word 2 minute round of several bets,
#a minimum of 4 bets can occur and a limit of 15...
#assumes one could only make 15 bets in 2 minutes,  and a min of 4 bets
Betting_Game<-R6Class('Betting_Game',

                      public = list(
                        name = NULL,
                        outcome = NULL,
                        max_bet = NULL,
                        bet_options = NULL,
                        rounds = NULL, #simple integer counting rounds
                        bet_outcome = NULL,  #for a given bet, who won? output something like c(p1,+3,p2,-3)
                        number_of_bets = NULL,
                        outcome_tally = NULL, #at end of round wht is the standing? c(number of bets,p1$name,w,l,p1$stash,p2$name,w,l,p2$stash)

                        initialize = function(name = NA, outcome = NA, bet_options=c(1,2,3), max_bet=3,rounds = 2) {
                          self$name <- name  #these functions will be called upon intitializing new objects
                          self$outcome <- outcome
                          self$bet_options<-bet_options
                          self$max_bet <- max_bet
                          self$rounds <- rounds
                          self$greet()
                        },
                        greet = function() {
                          cat(paste0("Hello, would you like to play a game?","\n\n\n"))
                        },
                        bet=function(p1,p2){  #take 2 players
                          player1<-p1
                          player2<-p2
                          players<-c(p1,p2)
                          makes_bet<-sample(players,1) #one idea would be to make a sorted list here.  then makes_bet[2] would flip

                          flip_outcome<-NULL
                          flip_coin = function(){
                            #validate that bet of 'heads or tails' has occured
                            #if (call)
                            flip_outcome<<-rbinom(1,1,.5)
								flip<-flip_outcome
                            ifelse(flip==1,flip<-"Heads",flip<-"Tails")
                            cat("and the coin comes up ",flip,"!")
								return (flip_outcome)
                          }

                          who_flips<-NULL #Who gets to flip the coin?
                          if(makes_bet[[1]]$name == p1$name){who_flips<-p2}else{who_flips<-p1}
                          who_flips
                          cat("this program chooses",makes_bet[[1]]$name," to make the bet.\n\n\n")
                          cat ("and ",who_flips$name," will flip the coin.\n\n\n")
                          bet<-sample(self$bet_options,1)  #look at aggressive style of player, use that to multiply by 1,then round down; check to see if bet is smaller than remainder of both player's stash
                          cat(makes_bet[[1]]$name,"makes a bet of ",bet, ".\n\n\n")
                          call_coin<-sample(c(1,0),1)  #1 =  heads
                          cat (who_flips$name," is now flipping the coin.\n\n\n")
                          if(call_coin==1){
                            cat(makes_bet[[1]]$name," calls heads!\n\n\n")
                            }
                            else{cat(makes_bet[[1]]$name," calls tails!\n\n\n")}

                          #embed flip_coin into another function uses rounds to constrain the number of bets
                          #and then tracks the outcomes of the bets
                     #number_of_bets
					      flip_coin()

						  #bet_outcome
						     ifelse(call_coin==flip_outcome , print('wins!'),print('lose'))

                          #outcome_tally
                                                    #evaluate who wins to print winner and then the final score of stash.

                        }
                        )
)

game1<-Betting_Game$new("game 1")
game1$bet(p1,p2)



make_winner_grid<-function(num_of_players=2, num_of_rounds=1){
  #create a matrix?  or a data.frame?
  flip_count<-sample(1:20,1)  #to simulate a number of flips in one minute
  for(i in 1:flip_count) {
    game1<-Betting_Game$new("game 1")
    p1<-Player$new("Brian",10,3)
    p2<-Player$new("Julie",10)
    game1$bet(p1,p2)
  }
  #Need to track rounds
  #Need to track players
    #player count should be even at first
    ifelse( num_of_players%%2 == 0,print('there are an even number of players'),print("uneven number of players"))

  #need to know number of flips
  #need to know who won, who lost
  #need to know number of winners
    #need a count of player stashes

  }



a<-make_winner_grid(2, num_of_rounds=1)
