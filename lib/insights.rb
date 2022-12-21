module Spending_insights
    def generateInsights(budget_items)
    
    finalInsights = []
    
    budget_items.each do |item| 
    
        if item[:name] == "Rent" 
            if item[:value] > 1832
                rent_inst = "You are on the higher end of rent costs.The average rent price is around £1832 according to homelet."
            else
                rent_inst = "You are paying less than the average rent price in London!"
        
            end
            finalInsights.push(rent_inst)
        end
    
        if item[:name] == "Savings"
            if item[:value] > 300
                savings_inst =  "
                Average monthly savings are around £300, different factors influence this figure. You are on the right track! "
            else
                savings_inst = " 
                To Save better ,set a Budget: Establishing a budget is a great way to ensure that you are saving money each month. 
                Decide on a realistic budget that you are able to stick to and make sure to save a portion of your income each month."
            end
            finalInsights.push(savings_inst)
        end  
    
        if item[:name] == (("Phone" + "Bill") || ("Phone")) 
            if item[:value] > 45.60
                phone_inst = "According to Ofcom the average phone bill is around £45.60 per month. You could be getting better deals. Check websites like money supermarket.com or Uswitch.com to compare different deals available"
            else
            phone_inst =  " You are paying less than the average phone bill"
            end
            finalInsights.push(phone_inst)
        end
        if item[:name] == "Subscriptions" 
            if item[:value] > 41.7
                subs_inst = "The average amount spent on subscriptions acording to barclays is £41.7. You could save more by cutting down on subscriptions that you do not use alot."
            else
                subs_inst = "You are spending less than the national average on subscriptions!"
            end
            finalInsights.push(subs_inst)
        end

        if item[:name] == "Groceries" 
            if item[:value] > 206
                groceries_inst = "The average monthly grocery budget is £206 according to the office of national statistics.This may vary depending on where you live and the quality of food that you tend to purchase"
            else
                groceries_inst = "You are spending less than the national average on groceries"
            end
            finalInsights.push(groceries_inst)
        end
    
   
    end 
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

    return finalInsights
    end
    
    end
    