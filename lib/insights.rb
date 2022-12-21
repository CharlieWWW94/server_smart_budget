module Spending_insights
    def generateInsights(budget_items)
    
    finalInsights = []
    
    budget_items.each do |item| 
    
        if item[:name] == "Rent" && item[:value] > 1832
         rent_inst = "
        -You are on the higher end of rent costs.
        -The average rent price is around £1832 according to homelet.
        -This varies by the size of the property and the location of the property.
        -Proximity to the city is quoted as a major determing factor to high rent"
        else
         rent_inst = "
         -You are paying less than the average rent price in London!"
        
        end
        finalInsights.push(rent_inst)
    
        if item[:name] == "Savings" && item[:value] > 300
         savings_inst =  "Average monthly savings are around £300, different factors influence this figure. 
         You are on the right track! "
        else
         savings_inst = "
         Tips for saving better:
    
         1. Set a Budget: Establishing a budget is a great way to ensure that you are saving money each month. Decide on a realistic budget that you are able to stick to and make sure to save a portion of your income each month.
         
         2. Automate Your Savings: If you find it hard to save money each month, automate your savings to ensure that you are always saving a set amount. You can set up automatic transfers from your checking account to your savings account each month.
         
         3. Make Saving a Priority: Make saving a priority each month. Try to pay yourself first and set aside money for savings before you pay for anything else.
         
         4. Reduce Your Spending: Reducing your spending is a great way to save more money each month. Look for ways to save money on everyday expenses, such as cutting back on eating out and reducing your energy costs.
         
         5. Take Advantage of Rewards: If you use a credit card, take advantage of any rewards or cash back offers. You can also use credit card reward points to save money on travel, purchases, or other expenses.
         
         6. Invest in Your Future: Investing your money for the future is a great way to save for retirement and other long"
        end  
        finalInsights.push(savings_inst)
    
        if item[:name] == (("Phone" + "Bill") || ("Phone")) && item[:value] > 45.60
         phone_inst = " 
        -According to Ofcom the average phone bill is around £45.60 per month. 
        -You could be getting better deals. 
        -Check websites like money supermarket.com or Uswitch.com to compare
        different deals available"
        else
         phone_inst =  " You are paying less than the average phone bill"
        end
        finalInsights.push(phone_inst)
        if item[:name] == "Subscriptions" && item[:value] > 41.7
         subs_inst = "
        -The average amount spent on subscriptions acording to barclays is £41.7. 
        -You could save more by cutting down on subscriptions that you do not use alot."
        else
         subs_inst = "
        -You are spending less than the national average on subscriptions!"
        end
        finalInsights.push(subs_inst)
        if item[:name] == "Groceries" && item[:value] > 206
         groceries_inst = " 
        -The average monthly grocery budget is £206 according to the office of national statistics.
        -This may vary depending on where you live and the quality of food that you tend to purchase"
        else
         groceries_inst = " 
        -You are spending less than the national average on groceries"
        end
        finalInsights.push(groceries_inst)
    
        #finalInsights.push(rent_inst,savings_inst,phone_inst,groceries_inst)
        randomFacts =[
            "The average rent for a one-bedroom apartment in the UK is over £1,800 per month.",
             "Grocery costs make up between 10-20% of the average family's budget.",
             "The average monthly electricity bill in the UK is around £210.",  
             "The average family spends about £800 per month on transportation costs.",   
             "Childcare costs can range from £100-£1,000+ per month, depending on the type of care and the location.",    
             "The average cost of health insurance for a family of four is over £1,000 per month.",  
             "Cable and internet bills cost an average of £100+ per month.",      
             "The average cost for a cell phone plan is around £42 per month.",   
             "The average cost of car insurance is around £1,500 per year."]
        finalInsights.push(randomFacts.sample)
    end 
    return finalInsights
    end
    
    end
    