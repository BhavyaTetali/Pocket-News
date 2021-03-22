//
//  ViewController.swift
//  Pocket News
//
//  Created by Bhavya Tetali on 3/20/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate,UITableViewDelegate,UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var newsFeedArray : [News] = []
    var trendingNewsArray : [News] = []
    
    @IBOutlet weak var trendingCollectionView: UICollectionView!
    
    @IBOutlet weak var newsTableView: UITableView!
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // declare array and give count
        return newsFeedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = newsTableView.dequeueReusableCell(withIdentifier: "newsTVCell", for: indexPath) as! NewsTableViewCell
        let currNews = newsFeedArray[indexPath.row]
        
        cell.title.text = currNews.title
        cell.author.text = currNews.author
        cell.img.image = currNews.newsImage
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 171
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailView", sender: newsFeedArray[indexPath.row])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        newsTableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailView", sender: trendingNewsArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? NewsDetailViewController{
            if let selectedItem = sender as? News {
                detailVC.currNewsItem = selectedItem
            }
        }
        if let createStoryVC = segue.destination as? CreateStoryViewController{
            createStoryVC.viewController = self
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: trendingCollectionView.frame.width, height: trendingCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return trendingNewsArray.count
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = trendingCollectionView.dequeueReusableCell(withReuseIdentifier: "trendingCVCell", for: indexPath) as! TrendingCollectionViewCell
        let currTrendNews = trendingNewsArray[indexPath.row]
        cell.trendingTitle.text = currTrendNews.title
        cell.trendingImg.image = currTrendNews.newsImage
        
        return cell
        
    }
    /*
    override func viewDidLayoutSubviews() {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red: 0.03, green: 0.31, blue: 0.47, alpha: 1.00).cgColor, UIColor(red: 0.52, green: 0.85, blue: 0.81, alpha: 1.00).cgColor]
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.insertSublayer(layer, at:0)
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trendingCollectionView.delegate = self
        trendingCollectionView.dataSource = self
        newsTableView.delegate = self
        newsTableView.dataSource = self
        loadTrendingData()
        loadNewsData()
        
        self.view.backgroundColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1.0)
        
    }
    
    
    func loadNewsData(){
    
        newsFeedArray.append(News(title: "'It still feels surreal': BTS makes Grammys history, whether they win on Sunday or not", author: "Fatima-Tul Farha", description: "It has been nearly eight years since BTS took to the stage for their debut performance. At Sunday's Grammy Awards, the seven men from South Korea will have more firsts. They are up for best pop duo/group performance for Dynamite, their chart-topping English-language hit. It marks the group's first nomination as well as the first for a K-pop group. They're on tap to perform and it'll be the first time they'll do so armed with one of their own songs (they had a cameo at the 2020 Grammys, but more on that later).Making history and breaking records is nothing new for RM, Jin, Suga, J-Hope, Jimin, V and Jungkook. They're the first K-pop group to debut at the top of Billboard's Hot 100. They hold the Guinness World Records for most-viewed YouTube music video in 24 hours (Dynamite hit 101 million views). They've beat their own record for the best-selling South Korean album of all time. Along the way, they've gained a legion of fiercely loyal fans called ARMY (full disclosure: I am one of them).", imagePath: "images/entertainment1.jpg"))
        
        newsFeedArray.append(News(title: "Spoilers! Marvel's new Captain America talks 'Falcon and the Winter Soldier' role", author: "Brian Truitt", description: "Over the course of eight years and seven films, Chris Evans wielded the shield of the Marvel Cinematic Universe’s resident all-American superhero and moral center. Yet in the cliffhanger ending of the premiere of Marvel’s new “The Falcon and the Winter Soldier” series (now streaming on Disney+), there’s another guy not named Steve Rogers who’s been picked to be Captain America. The actor who plays him is steeled for any backlash: “People are probably going to hate it, and some people are going to love it,” says Wyatt Russell, whose new character John Walker now wears the star-spangled suit and wields that iconic shield – although the “A” on the outfit has undergone a snazzy makeover. Movies and TV shows “are there to make people feel emotions, and I'm hoping that that's what this show can do for people.  Hopefully they don't hate me too much,' he adds. But 'it would be an honor, I guess, to be disliked in the Marvel universe.", imagePath: "images/entertainment2.jpeg"))
        
        
        newsFeedArray.append(News(title: "These 6 easy brunch recipes are perfect to serve up for any spring celebration", author: "Carlie Dobkin", description: "There’s nothing quite like a Sunday brunch. It’s the perfect excuse to take it slow in the morning and indulge in both sweet and savory dishes. And Easter brunch is no exception. You can eat eggs and chocolate all day long, without anyone judging. Although big celebrations may be off the table this year, you can still enjoy the flavors of spring by preparing a simple brunch spread with delicious dishes to impress your loved ones at home. Filled with simple and delicious recipes, this list will brighten up any brunch menu. Whether you’re craving a decadent stack of pancakes or a cheesy egg casserole, there’s something for everyone. If eating your favorite foods isn’t enough to make you excited about brunch, you’ll be happy to hear that these recipes are also incredibly easy to make. Each dish includes ingredients found at ALDI, so you can count on fresh flavors, high-quality ingredients and unbeatable prices.", imagePath: "images/entertainment3.jpg"))
        
        
        newsFeedArray.append(News(title: "Queen Elizabeth II's Trooping the Colour birthday parade canceled for the second year due to pandemic", author: "Maria Puente", description: "The coronavirus pandemic is still affecting Britain's royal show: Queen Elizabeth II's annual birthday parade has been canceled for the second year in a row.Buckingham Palace announced Friday that, following consultations with government officials and other relevant parties, the Queen’s Official Birthday Parade, also known as Trooping the Colour, will not happen this year in its traditional form in central London.Options for an alternative parade, in the quadrangle at Windsor Castle, are being considered, the palace statement said. Also, the annual Garter service, usually held in June, will not take place this year, either. It was canceled last year as well. The Trooping the Colour parade, which celebrates the queen's official birthday (her real birthday is in April, when she turns 95), was canceled last year, too, due to the pandemic. Instead, a reduced celebration was staged at Windsor Castle where she moved in March 2020 to shelter during pandemic lockdown, and where she remains, along with her husband, Prince Philip, 99, who has just returned after a month in the hospital. His 100th birthday is in June.", imagePath: "images/entertainment4.jpg"))
        
        
        newsFeedArray.append(News(title: "GM to move hundreds of salaried workers in Southeast Michigan locations", author: "Ben Tobin", description: "General Motors is shifting hundreds of salaried workers among its southeastern Michigan locations and declaring where some new hires will work as it prepares to bring its remote workforce back to the office starting this summer.The location shifts, GM leaders say, will improve collaboration among teams.'The moves also reflect adapting to post-pandemic workplaces where the future will be more flexible,' said GM spokesman David Caldwell. GM leaders held team meetings on Wednesday with white-collar workers to discuss ways in which the workplace might change for some of them when they return to the office, Caldwell said.'These were internal meetings on the subject of the ongoing planning for return-to-work, in which there was active discussion on the benefits of remote work and how to keep some of that going forward,' Caldwell said in an email. 'This was not a roll-out of a plan, however, but it’s definitely progress towards that.'", imagePath: "images/finance1.jpg"))
        
        newsFeedArray.append(News(title: "Did you know paying off a car loan can lower your credit? Here are 5 ways credit scores don't make sense.", author: "Lyle Daly", description: "Whether you like it or not, your credit score is a big part of your everyday life. You'll have a much easier time financially with a higher credit score. But as you try to increase your credit score, you may find yourself running into a frustrating issue -- credit scores aren't nearly as intuitive as you'd think. Things that seem like they'd help your score can actually hurt it, and vice versa. In situations like these, you could wonder why a smart, responsible financial decision (like paying off a loan) made your credit score drop. Simply put, there are plenty of ways credit scores don't make sense. But when you're aware of these oddities, you can make sure they don't trip you up as you work toward good credit.", imagePath: "images/finance2.jpg"))
        
        
        newsFeedArray.append(News(title: "Ford F-150 to be built 'without certain parts' as company is hit hard by chip shortage", author: "Jamie L. LaReau", description: "The Ford F-150 will be built without key parts due to the global semiconductor shortage, the Ford Motor Co. announced Thursday. The global semiconductor shortage – combined with parts shortages created by the central U.S. winter storm in February – is prompting Ford to build F-150 trucks and Edge SUVs in North America without certain parts, including some electronic modules that contain scarce semiconductors, the company wrote in a statement. It continued: Ford will build and hold the vehicles for a number of weeks, then ship the vehicles to dealers once the modules are available and comprehensive quality checks are complete. The Ford F-150 is built at Dearborn Truck in Michigan and Kansas City Assembly Plant in Claycomo, Missouri. The F-Series is the biggest revenue generator for the company.The announcement is a major hit to the Dearborn, Michigan-based company, as the F-150 has been the best-selling vehicle in the United States since 1981.", imagePath: "images/finance3.jpg"))
        
        
        newsFeedArray.append(News(title: "What is a SPAC and why is it such a big trend in real estate?", author: "Matthew Frankel", description: "SPAC stands for special purpose acquisition company and is created for the sole purpose of acquiring a private company and taking it public. As a simplified example, a SPAC might complete an IPO and raise $300 million. It could then acquire a private company, which would then get the $300 million as growth capital. The combined company would then assume the name of the acquisition target and change its ticker symbol to reflect the change. One key detail to keep in mind is that when a SPAC first goes public, it doesn't have a business. It completes an IPO and puts the proceeds in a trust account. For this reason, SPACs are also commonly known as blank check companies. Investors are essentially giving the SPAC's managers a blank check to go shopping for an acquisition target.", imagePath: "images/finance4.jpg"))
        
        
        newsFeedArray.append(News(title: "A guide to NFTs: What are they, and why did someone spend $69 million for one?", author: "Brett Molina", description: "Last week, the auction house Christie's announced the artist Beeple sold a piece of artwork for more than $69 million, the third highest price for a living artist. But Everydays: The First 5000 Days isn't a physical work of art. It's all digital. The work was sold through an NFT, a burgeoning technology that could potentially change how we own everything from art work and concert tickets to our homes. The mind-boggling dollar figures behind the sale have helped bring attention to NFTs, along with support from bigger names. NBA Top Shot, for example, is a digital collectibles service that allows fans to collect and own digital highlights from NBA games, like a LeBron James dunk. Meanwhile, Kansas City Chiefs quarterback Patrick Mahomes launched his own digital art gallery using NFTs. Then there's Tesla CEO Elon Musk, who is selling a recent tweet as an NFT.", imagePath: "images/tech1.jpg"))
        
        newsFeedArray.append(News(title: "PlayStation VR: These are the new controllers for Sony's virtual reality platform", author: "Brett Molina", description: "The innovations added to the controllers for video game console PlayStation 5 are coming to Sony's next virtual reality platform.The electronics giant unveiled Thursday the first look at controllers for its next iteration of PlayStation VR, a virtual reality headset compatible with the PS5.The orb-shaped controllers essentially split a PS5 controller in two, each featuring a thumbstick, triggers, and a small selection of buttons on the top.Each trigger is adaptive, says Sony, and will generate tension depending on the action, such as pulling back a bow before firing an arrow or pushing down on a spring before its release.", imagePath: "images/tech2.jpg"))
        
        newsFeedArray.append(News(title: "Facebook vs. Apple: Mark Zuckerberg says company will be in 'good position' after iOS changes", author: "Brett Molina", description: "Facebook CEO Mark Zuckerberg says the social network will be in a 'good position' following a significant update to the operating system that powers Apple's iPhones. Zuckerberg made the remarks during an interview on the app Clubhouse, which also featured Spotify CEO Daniel Ek and Shopify CEO Tobi Lütke.When asked about the iOS 14.5 update, which include more transparency involving user data, Zuckerberg said he feels confident Facebook can adjust. 'We'll be in a good position,' he said. 'I think it's possible that we may even be in a stronger position if Apple's changes encourage more businesses to conduct commerce on our platforms, by making it harder for them to basically use their data in order to find the customers that would want to use their products outside of our platforms.'", imagePath: "images/tech3.jpg"))
        
        newsFeedArray.append(News(title: "15 Alexa commands you’ll wish you knew sooner", author: "Kim Komando", description: "We’re firmly in the age of smart speakers. Maybe you rely on Siri or the assistant built into your phone, but you likely have a full-fledged AI assistant in your home, too. Alexa, built into the Amazon Echo, is everywhere. If you have an Echo, there’s a good chance Alexa has driven you up the wall a time or two with the follow-up questions. Tap or click here for 5 quick fixes to Amazon Echo annoyances.While you’re poking around the settings, don’t ignore security. Tap or click for essential privacy settings you have to check now, including who can turn on your Echo's camera and see what you're doing.", imagePath: "images/tech4.jpeg"))
        
        
    }
    
    func loadTrendingData(){
        
        trendingNewsArray.append(News(title: "Why we're scared for the pandemic to end", author: "Alia E. Dastagir", description: "It feels strange, the idea of being together in the world again. Public transit makes us sweat. The prospect of crowded restaurants and bars is thrilling but unfamiliar. People thirsting for daily interaction now worry they've lost the ease with which they once socialized. For so long we've been looking toward a world that gathers and touches, a world where smiles are unobscured and conversations unmuffled, but the longer we've been denied it, the more stressful its return has become. 'COVID definitely has shifted our experience, our perception of what's considered normal,' said Lynn Bufka, senior director of practice transformation and quality at the American Psychological Association. 'We should expect that there's going to be some period of time when how we respond to the world around us is going to be different, where we're going to potentially feel like this is ... awkward. But what can be helpful is to recognize that everyone likely feels that way to some extent. Now we're trying to figure out what normal is again.'", imagePath: "images/trending1.jpg"))
        
        trendingNewsArray.append(News(title: "Go climb a mountain: The highest peak in every US state", author: "Nam DoSan", description: "Comprising 26 climate zones and 25 physically unique regions, the United States is one of the most geographically diverse nations in the world. Measured by the distance from base to summit, the U.S. is home to both the tallest land-based mountain – Denali in Alaska – and the eighth lowest place — Death Valley in California – on Earth. To determine the highest point in every state, 24/7 Tempo used data from the U.S. Census Bureau’s Statistical Abstract of the United States. The highest peaks range in elevation from just 345 feet in Florida to 20,320 feet in Alaska. Outdoor recreation consumer spending figures came from the Bureau of Economic Analysis and are for 2017. Conventional outdoor recreation activities (such as camping, hiking, boating, and hunting); other core activities.", imagePath: "images/trending2.jpg"))
        
        trendingNewsArray.append(News(title: "'It's going to be very intense': Wisconsin will occupy familiar spot in 2022 — epicenter of national politics", author: "Craig Gilbert", description: "Wisconsin, Pennsylvania, Arizona and Georgia were the four closest states in the last presidential race. They’re also the only four states expected to have top-tier races for both governor and U.S. Senate in next year’s mid-terms. In short, ground zero in American politics in 2022 looks a lot like ground zero in 2020. The Senate races in these battleground states will go a long way toward deciding control of that 50-50 chamber. And their contests for governor will be doubly important because they will decide who sets the voting rules in states most likely to determine the 2024 presidential race.", imagePath: "images/trending3.jpg"))
        
        trendingNewsArray.append(News(title: "Biden celebrates meeting 100M vaccine dose goal weeks early; pizzeria owner in jail for violating virus rules: Live COVID-19 updates", author: "Adrianna Rodriguez", description: "The U.S. has met President Joe Biden's goal of administering 100 million COVID-19 vaccine doses about 6 weeks ahead of schedule. Biden pumped his fist as Dr. Rochelle Walensky, director of the Centers for Disease Control and Prevention, said the target of vaccinating 100 million Americans had been reached Friday. As of Saturday, the CDC reports that 121 million doses have been delivered. When Biden took office in January, 20 million had been administered. Biden has for months promised that 100 million doses would be administered in his first 100 days in office. Biden met with scientists at the CDC in Atlanta on Friday to express his gratitude for their work trying to stop the coronavirus, while also learning about variants of the virus and the unfolding medical situation.", imagePath: "images/trending4.jpg"))
        
    }


}

