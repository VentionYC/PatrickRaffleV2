# Raffle 
## What has already been done????
### Raffle 
#### contructor
        1. Enter Raffle fee
        2. Time Interval to pick winner
        3. Fixed Gaslane for VRF
        4. Fixed VRFCoordiantor for VRF
        5. Subscription ID for VRF
        6. Use chain link or not for VRF

    1. Stored enter user
    2. Chainlink VRF 2.5 to get random number
      - have the call of "requestRandomWords" --TODO need a method to auto trigger this function--
      - "requestRandomWords" will trigger "fulfillRandomWords" --TODO need override logic inside--



















# Learning small tips

* address payable[] Good
* address[] payable Bad

* struct type default stored in storage
    * so if it's a return parameter in function, we should modify it as memory
