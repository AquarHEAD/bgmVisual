# encoding: utf-8

require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'haml'
require 'nokogiri'
require 'open-uri'

get '/' do
  haml :index
end

post '/' do
  page_num = 1
  @items = []
  while true
    col_page = Nokogiri::HTML(open("http://bgm.tv/anime/list/#{params[:bgmid]}/collect?page=#{page_num}"))
    p_items = col_page.css("li.item")
    p_items.each do |item|
      info = {}
      info[:title] = item.css("h3 a").text
      info[:small] = item.css("h3 small").text
      info[:id] = item["id"].split("_")[1]
      info[:my_score] = item.css("p.collectInfo span")[0]["class"].split[0].match(/\d+/)[0].to_f
      item_page = Nokogiri::HTML(open("http://bgm.tv/subject/#{info[:id]}"))
      info[:global_score] = item_page.css("div.global_score span.number").text.to_f
      info[:rank] = item_page.css("small.alarm").text
      puts info.inspect
      @items << info
    end
    p_links = col_page.css("div.page_inner a.p")
    if (p_links[-1] && p_links[-1].text == "››")
      page_num += 1
    else
      break
    end
  end
  haml :result
end

get '/aquarhead' do
  @items = []
  @items << {title:"无头骑士异闻录", small:"デュラララ!!", id:"2463", my_score:10.0, global_score:8.2, rank:"#108"}
  @items << {title:"红白黑黄", small:"RWBY", id:"75055", my_score:7.0, global_score:7.4, rank:"#777"}
  @items << {title:"言叶之庭", small:"言の葉の庭", id:"58949", my_score:7.0, global_score:7.7, rank:"#463"}
  @items << {title:"科学超电磁炮S", small:"とある科学の超電磁砲S", id:"51928", my_score:8.0, global_score:7.8, rank:"#353"}
  @items << {title:"头文字D Fifth Stage", small:"頭文字D Fifth Stage", id:"46312", my_score:7.0, global_score:7.3, rank:"#868"}
  @items << {title:"樱花庄的宠物女孩", small:"さくら荘のペットな彼女", id:"41488", my_score:10.0, global_score:7.5, rank:"#677"}
  @items << {title:"军火女王 第2期", small:"ヨルムンガンドPERFECT ORDER", id:"42339", my_score:9.0, global_score:7.4, rank:"#803"}
  @items << {title:"一起一起这里那里", small:"あっちこっち", id:"28431", my_score:10.0, global_score:7.1, rank:"#1232"}
  @items << {title:"我们仍未知道那天所看见的花的名字。", small:"あの日見た花の名前を僕達はまだ知らない。", id:"10440", my_score:7.0, global_score:8.3, rank:"#91"}
  @items << {title:"轻音少女 第二季", small:"けいおん!!", id:"3774", my_score:10.0, global_score:7.7, rank:"#422"}
  @items << {title:"军火女王", small:"ヨルムンガンド", id:"29073", my_score:8.0, global_score:7.4, rank:"#758"}
  @items << {title:"冰菓", small:"氷菓", id:"27364", my_score:9.0, global_score:8.0, rank:"#214"}
  @items << {title:"Fate/Zero", small:"", id:"10639", my_score:10.0, global_score:8.3, rank:"#65"}
  @items << {title:"战斗妖精雪风", small:"戦闘妖精雪風", id:"2842", my_score:8.0, global_score:8.1, rank:"#201"}
  @items << {title:"Fate/Prototype", small:"", id:"30055", my_score:8.0, global_score:7.6, rank:"#548"}
  @items << {title:"萤火之森", small:"蛍火の杜へ", id:"12544", my_score:8.0, global_score:8.0, rank:"#244"}
  @items << {title:"文学少女 剧场版", small:"劇場版“文学少女”", id:"3183", my_score:9.0, global_score:6.6, rank:"#1773"}
  @items << {title:"妖精的旋律", small:"エルフェンリート", id:"536", my_score:8.0, global_score:8.0, rank:"#247"}
  @items << {title:"日在校园", small:"School Days", id:"827", my_score:8.0, global_score:7.2, rank:"#1014"}
  @items << {title:"轻音少女", small:"けいおん!", id:"1424", my_score:8.0, global_score:7.8, rank:"#325"}
  @items << {title:"魔法少女小圆", small:"魔法少女まどか☆マギカ", id:"9717", my_score:9.0, global_score:8.4, rank:"#25"}
  @items << {title:"幻想嘉年华", small:"カーニバル・ファンタズム", id:"18882", my_score:10.0, global_score:8.0, rank:"#236"}
  @items << {title:"龙与虎 OVA「弁当の极意」", small:"とらドラ！ OVA「弁当の極意」", id:"29139", my_score:9.0, global_score:7.5, rank:"#624"}
  @items << {title:"黑之契约者 流星的双子", small:"DARKER THAN BLACK -流星の双子-", id:"2354", my_score:4.0, global_score:7.5, rank:"#639"}
  @items << {title:"纯白交响曲", small:"ましろ色シンフォニー -The color of lovers-", id:"12557", my_score:8.0, global_score:6.7, rank:"#1750"}
  @items << {title:"真实之泪", small:"true tears", id:"309", my_score:7.0, global_score:7.9, rank:"#281"}
  @items << {title:"青空下的约定", small:"この青空に約束を―", id:"9732", my_score:7.0, global_score:6.0, rank:"#2070"}
  @items << {title:"Fate/stay night Unlimited Blade Works", small:"", id:"3484", my_score:7.0, global_score:7.2, rank:"#1031"}
  @items << {title:"凉宫春日的忧郁 2009", small:"涼宮ハルヒの憂鬱", id:"1606", my_score:8.0, global_score:7.8, rank:"#370"}
  @items << {title:"白色相簿 下半编章", small:"WHITE ALBUM-後半", id:"2586", my_score:7.0, global_score:7.1, rank:"#1151"}
  @items << {title:"黑客帝国动画版", small:"The Animatrix", id:"496", my_score:6.0, global_score:8.2, rank:"#141"}
  @items << {title:"白色相簿", small:"WHITE ALBUM", id:"993", my_score:7.0, global_score:7.0, rank:"#1362"}
  @items << {title:"你所期望的永远 〜Next Season〜", small:"君が望む永遠 〜Next Season〜", id:"2172", my_score:8.0, global_score:6.8, rank:"#1485"}
  @items << {title:"你所期望的永远", small:"君が望む永遠", id:"1650", my_score:7.0, global_score:7.5, rank:"#737"}
  @items << {title:"黑之契约者 外传", small:"DARKER THAN BLACK -黒の契約者- 外伝", id:"3960", my_score:7.0, global_score:7.8, rank:"#399"}
  @items << {title:"初夏", small:"_summer", id:"9733", my_score:7.0, global_score:5.8, rank:""}
  @items << {title:"云之彼端，约定的地方", small:"雲のむこう、約束の場所", id:"1707", my_score:7.0, global_score:7.8, rank:"#382"}
  @items << {title:"秒速5厘米", small:"秒速5センチメートル", id:"927", my_score:9.0, global_score:8.4, rank:"#39"}
  @items << {title:"破刃之剑 第六章 恸哭之寨", small:"ブレイク ブレイド 第六章 慟哭ノ砦", id:"11045", my_score:8.0, global_score:6.9, rank:"#1386"}
  @items << {title:"破刃之剑 第五章 死线之涯", small:"ブレイク ブレイド 第五章 死線ノ涯", id:"11044", my_score:8.0, global_score:7.2, rank:"#1006"}
  @items << {title:"破刃之剑 第四章 惨祸之地", small:"ブレイク ブレイド 第四章 惨禍ノ地", id:"11043", my_score:8.0, global_score:7.4, rank:"#857"}
  @items << {title:"破刃之剑 第三章 凶刃之痕", small:"ブレイク ブレイド 第三章 凶刃ノ痕", id:"7666", my_score:8.0, global_score:7.3, rank:"#986"}
  @items << {title:"破刃之剑 第二章 诀别之路", small:"ブレイク ブレイド 第二章 訣別ノ路", id:"5499", my_score:7.0, global_score:7.3, rank:"#954"}
  @items << {title:"破刃之剑 第一章 觉醒之刻", small:"ブレイク ブレイド 第一章 覚醒ノ刻", id:"5498", my_score:7.0, global_score:7.2, rank:"#1086"}
  @items << {title:"永不消失的彩虹", small:"Gift 〜ギフト〜 eternal rainbow", id:"4240", my_score:6.0, global_score:5.9, rank:"#2069"}
  @items << {title:"神的记事本", small:"神様のメモ帳", id:"15237", my_score:7.0, global_score:7.0, rank:"#1367"}
  @items << {title:"风之谷", small:"風の谷のナウシカ", id:"295", my_score:9.0, global_score:8.4, rank:"#54"}
  @items << {title:"机器人总动员", small:"Wall·E", id:"1104", my_score:8.0, global_score:8.3, rank:"#76"}
  @items << {title:"幻灵镇魂曲", small:"Phantom -Requiem for the Phantom-", id:"1426", my_score:9.0, global_score:7.2, rank:"#1020"}
  @items << {title:"黑之契约者", small:"DARKER THAN BLACK -黒の契約者-", id:"292", my_score:8.0, global_score:8.1, rank:"#150"}
  @items << {title:"战场女武神", small:"戦場のヴァルキュリア", id:"1421", my_score:8.0, global_score:6.6, rank:"#1785"}
  @items << {title:"魔法少女奈叶A's", small:"魔法少女リリカルなのはA's", id:"1263", my_score:7.0, global_score:7.9, rank:"#292"}
  @items << {title:"魔法少女奈叶", small:"魔法少女リリカルなのは", id:"1262", my_score:7.0, global_score:7.5, rank:"#663"}
  @items << {title:"零之使魔 三美姬的轮舞", small:"ゼロの使い魔 ～三美姫の輪舞～", id:"763", my_score:7.0, global_score:6.6, rank:"#1867"}
  @items << {title:"零之使魔 双月骑士", small:"ゼロの使い魔 双月の騎士", id:"1103", my_score:7.0, global_score:6.9, rank:"#1553"}
  @items << {title:"CLANNAD 剧场版", small:"劇場版 CLANNAD", id:"3686", my_score:6.0, global_score:6.3, rank:"#2001"}
  @items << {title:"零之使魔", small:"ゼロの使い魔", id:"1880", my_score:7.0, global_score:7.1, rank:"#1299"}
  @items << {title:"命运石之门", small:"Steins;Gate", id:"10380", my_score:8.0, global_score:8.4, rank:"#24"}
  @items << {title:"CLANNAD ～AFTER STORY～", small:"", id:"876", my_score:10.0, global_score:9.0, rank:"#5"}
  @items << {title:"Kanon", small:"", id:"274", my_score:10.0, global_score:8.0, rank:"#210"}
  @items << {title:"灼眼的夏娜", small:"灼眼のシャナ", id:"490", my_score:7.0, global_score:7.4, rank:"#826"}
  @items << {title:"AIR", small:"", id:"234", my_score:7.0, global_score:8.4, rank:"#59"}
  @items << {title:"化物语", small:"化物語", id:"1671", my_score:6.0, global_score:8.3, rank:"#85"}
  @items << {title:"sola", small:"", id:"798", my_score:10.0, global_score:7.5, rank:"#644"}
  @items << {title:"CLANNAD", small:"CLANNAD -クラナド-", id:"51", my_score:9.0, global_score:8.6, rank:"#17"}
  @items << {title:"龙与虎", small:"とらドラ！", id:"909", my_score:9.0, global_score:8.2, rank:"#107"}
  @items << {title:"Fate/stay night", small:"", id:"290", my_score:9.0, global_score:7.5, rank:"#695"}
  @items << {title:"魔法禁书目录II", small:"とある魔術の禁書目録Ⅱ", id:"7843", my_score:8.0, global_score:7.1, rank:"#1202"}
  @items << {title:"科学超电磁炮 OVA", small:"とある科学の超電磁砲 OVA", id:"9728", my_score:8.0, global_score:7.4, rank:"#763"}
  @items << {title:"科学超电磁炮", small:"とある科学の超電磁砲", id:"2585", my_score:9.0, global_score:7.8, rank:"#346"}
  @items << {title:"仰望半月的夜空", small:"半分の月がのぼる空", id:"1839", my_score:9.0, global_score:7.1, rank:"#1140"}
  @items << {title:"丹特丽安的书架", small:"ダンタリアンの書架", id:"14667", my_score:8.0, global_score:7.2, rank:"#1079"}
  @items << {title:"魔法禁书目录", small:"とある魔術の禁書目録", id:"1014", my_score:7.0, global_score:7.2, rank:"#1100"}
  @items << {title:"Angel Beats!", small:"", id:"1851", my_score:7.0, global_score:7.7, rank:"#461"}
  @items << {title:"悠久之翼2", small:"ef - a tale of melodies.", id:"1029", my_score:10.0, global_score:8.1, rank:"#163"}
  @items << {title:"悠久之翼", small:"ef - a tale of memories.", id:"799", my_score:9.0, global_score:8.1, rank:"#152"}
  @items << {title:"Code Geass 反叛的鲁路修R2", small:"コードギアス 反逆のルルーシュR2", id:"8", my_score:9.0, global_score:8.1, rank:"#135"}
  @items << {title:"Code Geass 反叛的鲁路修", small:"コードギアス 反逆のルルーシュ", id:"793", my_score:7.0, global_score:8.3, rank:"#67"}
  @items << {title:"空之境界 终章 空之境界", small:"空の境界 終章", id:"11629", my_score:7.0, global_score:7.5, rank:"#615"}
  @items << {title:"空之境界 第七章 杀人考察（后）", small:"空の境界 第七章 殺人考察(後)", id:"3423", my_score:10.0, global_score:8.2, rank:"#96"}
  @items << {title:"空之境界 第二章 杀人考察（前）", small:"空の境界 第二章 殺人考察(前)", id:"812", my_score:8.0, global_score:8.0, rank:"#196"}
  @items << {title:"空之境界 第六章 忘却录音", small:"空の境界 第六章 忘却録音", id:"2225", my_score:7.0, global_score:7.7, rank:"#473"}
  @items << {title:"空之境界 第三章 痛觉残留", small:"空の境界 第三章 痛覚残留", id:"767", my_score:7.0, global_score:8.2, rank:"#129"}
  @items << {title:"空之境界 第四章 伽蓝之洞", small:"空の境界 第四章 伽藍の洞", id:"766", my_score:8.0, global_score:8.0, rank:"#216"}
  @items << {title:"空之境界 第五章 矛盾螺旋", small:"空の境界 第五章 矛盾螺旋", id:"1333", my_score:10.0, global_score:8.4, rank:"#33"}
  @items << {title:"最终幻想VII：降临之子", small:"ファイナルファンタジーVII アドベントチルドレン", id:"1890", my_score:8.0, global_score:7.9, rank:"#301"}
  @items << {title:"死亡笔记", small:"DEATH NOTE", id:"1773", my_score:10.0, global_score:8.3, rank:"#62"}
  @items << {title:"钢之炼金术师 FULLMETAL ALCHEMIST", small:"鋼の錬金術師 FULLMETAL ALCHEMIST", id:"1428", my_score:10.0, global_score:8.6, rank:"#14"}
  @items << {title:"空之境界 第一章 俯瞰风景", small:"空の境界 第一章 俯瞰風景", id:"233", my_score:8.0, global_score:8.1, rank:"#145"}
  @items << {title:"头文字D Fourth Stage", small:"頭文字D Fourth Stage", id:"3816", my_score:9.0, global_score:7.5, rank:"#699"}
  @items << {title:"头文字D Third Stage", small:"頭文字D Third Stage", id:"9569", my_score:7.0, global_score:7.3, rank:"#899"}
  @items << {title:"头文字D Second Stage", small:"頭文字D Second Stage", id:"9568", my_score:7.0, global_score:7.5, rank:"#757"}
  @items << {title:"最終流放", small:"LAST EXILE", id:"921", my_score:10.0, global_score:8.1, rank:"#172"}
  haml :result
end
