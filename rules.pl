text(1, 天皇は、日本国の象徴であり日本国民統合の象徴であつて、この地位は、主権の存する日本国民の総意に基く。).

rule(1, 天皇, [def(象徴(日本国, 日本国民統合)), by(基づく(地位, 日本国民の総意))]).

%--------------------------------------------------------------------
text(2, 皇位は、世襲のものであつて、国会の議決した皇室典範の定めるところにより、これを継承する。).

rule(2, 皇位, [def(世襲のもの), by(継承する(皇室典範の定め))]).

%--------------------------------------------------------------------
text(3, 天皇の国事に関するすべての行為には、内閣の助言と承認を必要とし、内閣が、その責任を負ふ。).

rule(3, 国事行為, [def(天皇の国事に関するすべての行為), need(内閣の助言), need(内閣の承認), res(責任(内閣))]).

%--------------------------------------------------------------------
text(4-1, 天皇は、この憲法の定める国事に関する行為のみを行ひ、国政に関する権能を有しない。).
text(4-2, 天皇は、法律の定めるところにより、その国事に関する行為を委任することができる。).

rule(4-1, 天皇, [do(国事行為), have_not(国政に関する権能)]).
rule(4-2, 天皇, [can(委任(国事行為, 法律の定めるところにより))]).

%--------------------------------------------------------------------
text(5, 皇室典範の定めるところにより摂政を置くときは、摂政は、天皇の名でその国事に関する行為を行ふ。この場合には、前条第一項の規定を準用する。).

rule(5, 摂政, [by(定める(皇室典範)), do(国事行為(天皇の名で)), apply(4-1)]).

%--------------------------------------------------------------------
text(6-1, 天皇は、国会の指名に基いて、内閣総理大臣を任命する。).
text(6-2, 天皇は、内閣の指名に基いて、最高裁判所の長たる裁判官を任命する。).

rule(6-1, 天皇, [do(任命(内閣総理大臣, by(国会の指名)))]).
rule(6-2, 天皇, [do(任命(最高裁判所裁判長, by(内閣の指名)))]).

%--------------------------------------------------------------------
text(7, 天皇は、内閣の助言と承認により、国民のために、左の国事に関する行為を行ふ。).

rule(7, 天皇, [do(国事行為(by(内閣の助言と承認), for(国民のために)))]).
rule(7, 国事行為, [def(公布(憲法改正, 法律, 政令, 条約)),
				 def(召集(国会)),
				 def(解散(衆議院)),
				 def(公示(国会議員の総選挙)),
				 def(任免(国務大臣及び法律の定めるその他の官吏)),
				 def(認証(全権委任状及び公使の信任状)),
				 def(大赦),
				 def(特赦),
				 def(減刑),
				 def(免除(刑の執行)),
				 def(認証(復権)),
				 def(授与(栄典)),
				 def(認証(批准書及び法律の定めるその他の外交文書)),
				 def(接受(外国の大使及び公使)),
				 def(儀式)]).

%--------------------------------------------------------------------
text(8, 皇室に財産を譲り渡し、又は皇室が、財産を譲り受け、若しくは賜与することは、国会の議決に基かなければならない。).

rule(8, 皇室への財産譲渡, [by(国会の議決)]).
rule(8, 皇室への財産譲受, [by(国会の議決)]).
rule(8, 皇室への財産賜与, [by(国会の議決)]).

%--------------------------------------------------------------------
% 第２章 戦争の放棄

text(9-1, 日本国民は、正義と秩序を基調とする国際平和を誠実に希求し、国権の発動たる戦争と、武力による威嚇又は武力の行使は、国際紛争を解決する手段としては、永久にこれを放棄する。).
text(9-2, 前項の目的を達するため、陸海空軍その他の戦力は、これを保持しない。国の交戦権は、これを認めない。).

rule(9-1, 日本国民, [call(正義と秩序を基調とする国際平和), renounce(国権の発動たる戦争(as(国際紛争を解決する手段))), renounce(武力による威嚇又は武力の行使(as(国際紛争を解決する手段)))]).
rule(9-2, 日本, [have_not(陸海空軍その他の戦力), not_recognize(国の交戦権)]).

%--------------------------------------------------------------------
% 第３章 国民の権利及び義務

text(10, 日本国民たる要件は, 法律でこれを定める。).

rule(10, 日本国民の要件, [by(法律で定める)]).

%--------------------------------------------------------------------
text(11, 国民は、すべての基本的人権の享有を妨げられない。この憲法が国民に保障する基本的人権は、侵すことのできない永久の権利として、現在及び将来の国民に与へられる。).

rule(11, 国民, [not_be_prevented(基本的人権の享有)]).
rule(11, 憲法, [guarantee(基本的人権)]).
rule(11, 基本的人権, [def(侵すことのできない永久の権利), confer(現在及び将来の国民)]).

%--------------------------------------------------------------------
text(12, この憲法が国民に保障する自由及び権利は、国民の不断の努力によつて、これを保持しなければならない。又、国民は、これを濫用してはならないのであつて、常に公共の福祉のためにこれを利用する責任を負ふ。).

rule(12, 国民, [maintain(憲法が保障する自由及び権利(by(不断の努力))), ban(濫用(自由及び権利)), res(利用する(自由及び権利(for(公共の福祉))))]).

%--------------------------------------------------------------------
text(13, すべて国民は、個人として尊重される。生命、自由及び幸福追求に対する国民の権利については、公共の福祉に反しない限り、立法その他の国政の上で、最大の尊重を必要とする。).

rule(13, 国民, [be_respected(as(個人)), right(生命、自由及び幸福追求の権利)]).
rule(13, 生命、自由及び幸福追求の権利, [need(最大の尊重(立法その他の国政の上で, extent(公共の福祉に反する場合)))]).

%--------------------------------------------------------------------
text(14-1, すべて国民は、法の下に平等であつて、人種、信条、性別、社会的身分又は門地により、政治的、経済的又は社会的関係において、差別されない。).
text(14-2, 華族その他の貴族の制度は、これを認めない。).
text(14-3, 栄誉、勲章その他の栄典の授与は、いかなる特権も伴はない。栄典の授与は、現にこれを有し、又は将来これを受ける者の一代に限り、その効力を有する。).

rule(14-1, 国民, [def(法の下に平等), not(差別(政治的、経済的又は社会的関係において, 人種、信条、性別、社会的身分又は門地により))]).
rule(14-2, 憲法, [not_recognize(華族その他の貴族の制度)]).
rule(14-3, 栄典, [def(栄誉), def(勲章), def(その他), not_recognize(特権)]).

%--------------------------------------------------------------------
text(15-1, 公務員を選定し、及びこれを罷免することは、国民固有の権利である。).
text(15-2, すべて公務員は、全体の奉仕者であつて、一部の奉仕者ではない。).
text(15-3, 公務員の選挙については、成年者による普通選挙を保障する。).
text(15-4, すべて選挙における投票の秘密は、これを侵してはならない。選挙人は、その選択に関し公的にも私的にも責任を問はれない。).

rule(15-1, 国民, [right(公務員の選定), right(公務員の罷免)]).
rule(15-2, 公務員, [def(全体の奉仕者), not(一部の奉仕者)]).
rule(15-3, 憲法, [guarantee(成年者による普通選挙(公務員の選挙))]).
rule(15-4, 国, [not_be_prevented(投票の秘密)]).
rule(15-4, 選挙人, [no_res(選択)]).

%--------------------------------------------------------------------
text(16, 何人も、損害の救済、公務員の罷免、法律、命令又は規則の制定、廃止又は改正その他の事項に関し、平穏に請願する権利を有し、何人も、かかる請願をしたためにいかなる差別待遇も受けない。).

rule(16, すべての人, [right(請願権(for(損害の救済), for(公務員の罷免), for(法律、命令又は規則の制定、廃止又は改正その他の事項))), not(差別待遇(for(請願)))]).

%--------------------------------------------------------------------
text(17, 何人も、公務員の不法行為により、損害を受けたときは、法律の定めるところにより、国又は公共団体に、その賠償を求めることができる。).

rule(17, すべての人, [can(賠償請求(公務員の不法行為による損害, by(法律), 国又は公共団体))]).

%--------------------------------------------------------------------
text(18, 何人も、いかなる奴隷的拘束も受けない。又、犯罪に因る処罰の場合を除いては、その意に反する苦役に服させられない。).

rule(18, すべての人, [not(奴隷的拘束), not(苦役(extent(犯罪に因る処罰)))]).

%--------------------------------------------------------------------
text(19, 思想及び良心の自由は、これを侵してはならない。).

rule(19, 憲法, [guarantee(思想及び良心の自由)]).

%--------------------------------------------------------------------
text(20-1, 信教の自由は、何人に対してもこれを保障する。いかなる宗教団体も、国から特権を受け、又は政治上の権力を行使してはならない。).
text(20-2, 何人も、宗教上の行為、祝典、儀式又は行事に参加することを強制されない。).
text(20-3, 国及びその機関は、宗教教育その他いかなる宗教的活動もしてはならない。).

rule(20-1, 憲法, [guarantee(信教の自由)]).
rule(20-1, 宗教団体, [ban(受ける(国からの特権)), ban(行使(政治上の権力))]).
rule(20-2, すべての人, [not(強制(宗教上の行為、祝典、儀式又は行事に参加すること))]).
rule(20-3, 国及びその機関, [ban(宗教的活動)]).
rule(20-3, 宗教的活動, [def(宗教教育), def(その他)]).

%--------------------------------------------------------------------
text(21-1, 集会、結社及び言論、出版その他一切の表現の自由は、これを保障する。).
text(21-2, 検閲は、これをしてはならない。通信の秘密は、これを侵してはならない。).

rule(21-1, 憲法, [guarantee(集会の自由), guarantee(結社の自由), guarantee(言論の自由), guarantee(出版の自由), guarantee(表現の自由)]).
rule(21-2, 国, [ban(検閲), ban(侵害(通信の秘密))]).

%--------------------------------------------------------------------
text(22-1, 何人も、公共の福祉に反しない限り、居住、移転及び職業選択の自由を有する。).
text(22-2, 何人も、外国に移住し、又は国籍を離脱する自由を侵されない。).

rule(22-1, すべての人, [have(居住、移転及び職業選択の自由)]).
rule(22-2, すべての人, [not_be_prevented(外国に移住し、又は国籍を離脱する自由)]).

%--------------------------------------------------------------------
text(23, 学問の自由は、これを保障する。).

rule(23, 憲法, [guarantee(学問の自由)]).

%--------------------------------------------------------------------
text(24-1, 婚姻は、両性の合意のみに基いて成立し、夫婦が同等の権利を有することを基本として、相互の協力により、維持されなければならない。).
text(24-2, 配偶者の選択、財産権、相続、住居の選定、離婚並びに婚姻及び家族に関するその他の事項に関しては、法律は、個人の尊厳と両性の本質的平等に立脚して、制定されなければならない。).

rule(24-1, 婚姻, [need(両性の合意)]).
rule(24-1, 夫婦, [right(同等), maintain(婚姻(by(相互の協力)))]).
rule(24-2, 法律, [need(制定(家族に関する事項, be_respected(個人の尊厳), be_respected(両性の本質的平等)))]).
rule(24-2, 家族に関する事項, [def(配偶者の選択), def(財産権), def(相続), def(住居の選定), def(離婚), def(婚姻)]).

%--------------------------------------------------------------------
text(25-1, すべて国民は、健康で文化的な最低限度の生活を営む権利を有する。).
text(25-2, 国は、すべての生活部面について、社会福祉、社会保障及び公衆衛生の向上及び増進に努めなければならない。).

rule(25-1, 国民, [right(健康で文化的な最低限度の生活を営む権利)]).
rule(25-2, 国, [shall(社会福祉の向上及び増進), shall(社会保障の向上及び増進), shall(公衆衛生の向上及び増進)]).

%--------------------------------------------------------------------
text(26-1, すべて国民は、法律の定めるところにより、その能力に応じて、ひとしく教育を受ける権利を有する。).
text(26-2, すべて国民は、法律の定めるところにより、その保護する子女に普通教育を受けさせる義務を負ふ。義務教育は、これを無償とする。).

rule(26-1, 国民, [right(能力に応じて、ひとしく教育を受ける権利(by(法律)))]).
rule(26-2, 国民, [shall(普通教育を受けさせる義務(for(保護する子女), by(法律)))]).

%--------------------------------------------------------------------
text(27-1, すべて国民は、勤労の権利を有し、義務を負ふ。).
text(27-2, 賃金、就業時間、休息その他の勤労条件に関する基準は、法律でこれを定める。).
text(27-3, 児童は、これを酷使してはならない。).

rule(27-1, 国民, [right(勤労), shall(勤労)]).
rule(27-2, 勤労条件, [def(賃金), def(就業時間), def(休息), def(その他)]).
rule(27-2, 勤労条件に関する基準, [by(法律)]).
rule(27-3, 児童, [not(酷使)]).

%--------------------------------------------------------------------
text(28, 勤労者の団結する権利及び団体交渉その他の団体行動をする権利は、これを保障する。).

rule(28, 憲法, [guarantee(団結権(for(勤労者))), guarantee(団体交渉権(for(勤労者))), guarantee(団体行動権(for(勤労者)))]).

%--------------------------------------------------------------------
text(29-1, 財産権は、これを侵してはならない。).
text(29-2, 財産権の内容は、公共の福祉に適合するやうに、法律でこれを定める。).
text(29-3, 私有財産は、正当な補償の下に、これを公共のために用ひることができる。).

rule(29-1, 憲法, [ban(侵害(財産権))]).
rule(29-2, 財産権, [need(公共の福祉への適合), by(法律)]).
rule(29-3, 私有財産, [can(使用(for(公共(正当な保障の下))))]).

%--------------------------------------------------------------------
text(30, 国民は、法律の定めるところにより、納税の義務を負ふ。).

rule(30, 国民, [shall(納税(by(法律)))]).

%--------------------------------------------------------------------
text(31, 何人も、法律の定める手続によらなければ、その生命若しくは自由を奪はれ、又はその他の刑罰を科せられない。).

rule(31, すべての人, [not(生命の剥奪(extent(法律に定める手続き))), not(自由の剥奪(extent(法律に定める手続き))), not(刑罰(extent(法律に定める手続き)))]).

%--------------------------------------------------------------------
text(32, 何人も、裁判所において裁判を受ける権利を奪はれない。).

rule(32, すべての人, [not_be_prevented(裁判を受ける権利)]).

%--------------------------------------------------------------------
text(33, 何人も、現行犯として逮捕される場合を除いては、権限を有する司法官憲が発し、且つ理由となつてゐる犯罪を明示する令状によらなければ、逮捕されない。).

rule(33, すべての人, [not(逮捕(extent(現行犯逮捕), need(令状(need(権限を有する司法官憲の発行, need(理由の明示))))))]).

%--------------------------------------------------------------------
text(34, 何人も、理由を直ちに告げられ、且つ、直ちに弁護人に依頼する権利を与へられなければ、抑留又は拘禁されない。).
text(34, 又、何人も、正当な理由がなければ、拘禁されず、要求があれば、その理由は、直ちに本人及びその弁護人の出席する公開の法廷で示されなければならない。).

rule(34, すべての人, [not(抑留(need(理由の告知), need(弁護人に依頼する権利)))]).
rule(34, すべての人, [not(拘禁(need(理由の告知), need(弁護人に依頼する権利), need(正当な理由)))]).
rule(34, 正当な理由, [need(開示(公開の法廷(本人及び弁護人の出席)))]).

%--------------------------------------------------------------------
text(35-1, 何人も、その住居、書類及び所持品について、侵入、捜索及び押収を受けることのない権利は、第三十三条の場合を除いては、正当な理由に基いて発せられ、且つ捜索する場所及び押収する物を明示する令状がなければ、侵されない。).
text(35-2, 捜索又は押収は、権限を有する司法官憲が発する各別の令状により、これを行ふ。).

rule(35-1, すべての人, [right(侵入、捜索及び押収を受けることのない権利(住居、書類及び所持品)), not_be_prevented(侵入、捜索及び押収を受けることのない権利(extent(33), need(令状(need(正当な理由), need(捜索する場所及び押収する物の明示)))))]).
rule(35-2, 捜索, [need(令状(発行(権限を有する司法官権)))]).
rule(35-2, 押収, [need(令状(発行(権限を有する司法官権)))]).

%--------------------------------------------------------------------
text(36, 公務員による拷問及び残虐な刑罰は、絶対にこれを禁ずる。).

rule(36, 公務員, [ban(拷問), ban(残虐な刑罰)]).

%--------------------------------------------------------------------
text(37-1, すべて刑事事件においては、被告人は、公平な裁判所の迅速な公開裁判を受ける権利を有する。).
text(37-2, 刑事被告人は、すべての証人に対して審問する機会を充分に与へられ、又、公費で自己のために強制的手続により証人を求める権利を有する。).
text(37-3, 刑事被告人は、いかなる場合にも、資格を有する弁護人を依頼することができる。被告人が自らこれを依頼することができないときは、国でこれを附する。).

rule(37-1, 被告人, [right(公平な裁判所の迅速な公開裁判を受ける権利(case(刑事事件)))]).
rule(37-2, 刑事被告人, [permit(審問する機会(for(すべての証人))), right(証人を求める権利(on(公費), on(強制手続), for(自己)))]).
rule(37-3, 刑事被告人, [can(資格を有する弁護人の依頼(not(例外))), right(国選弁護人の依頼(case(自ら依頼することができない)))]).

%--------------------------------------------------------------------
text(38-1, 何人も、自己に不利益な供述を強要されない。).
text(38-2, 強制、拷問若しくは脅迫による自白又は不当に長く抑留若しくは拘禁された後の自白は、これを証拠とすることができない。).
text(38-3, 何人も、自己に不利益な唯一の証拠が本人の自白である場合には、有罪とされ、又は刑罰を科せられない。).

rule(38-1, すべての人, [not(強要(自己に不利益な供述))]).
rule(38-2, not(証拠), [case(自白(on(強制))), case(自白(on(拷問))), case(自白(on(脅迫))), case(自白(on(不当に長い抑留))), case(自白(on(不当に長い拘禁)))]).
rule(38-3, すべての人, [not(有罪(case本人の自白(自己に不利益な唯一の証拠))), not(刑罰(case本人の自白(自己に不利益な唯一の証拠)))]).

%--------------------------------------------------------------------
text(39, 何人も、実行の時に適法であつた行為又は既に無罪とされた行為については、刑事上の責任を問はれない。).
text(39, 又、同一の犯罪について、重ねて刑事上の責任を問はれない。).

rule(39, すべての人, [no_res(行為(case(実行の時に適法であったもの), case(既に無罪とされたもの), on(刑事上))), no_res(同一の犯罪(on(重複)))]).

%--------------------------------------------------------------------
text(40, 何人も、抑留又は拘禁された後、無罪の裁判を受けたときは、法律の定めるところにより、国にその補償を求めることができる。).

rule(40, すべての人, [can(賠償請求(case(無罪の裁判を受けたとき(case(抑留後), case(拘禁後))), by(法律), 国))]).

%--------------------------------------------------------------------
% 第４章　国会
%--------------------------------------------------------------------
text(41, 国会は、国権の最高機関であつて、国の唯一の立法機関である。).

rule(41, 国会, [def(最高機関(国権)), def(立法機関(唯一))]).

%--------------------------------------------------------------------
text(42, 国会は、衆議院及び参議院の両議院でこれを構成する。).

rule(42, 国会, [def(構成する(両議院))]).
rule(42, 両議院, [def(衆議院及び参議院)]).

%--------------------------------------------------------------------
text(43-1, 両議院は、全国民を代表する選挙された議員でこれを組織する。).
text(43-2, 両議院の議員の定数は、法律でこれを定める。).

rule(43-1, 両議院, [def(組織する(選挙された議員(全国民の代表)))]).
rule(43-2, 議員定数(両議院), [by(法律)]).

%--------------------------------------------------------------------
text(44, 両議院の議員及びその選挙人の資格は、法律でこれを定める。但し、人種、信条、性別、社会的身分、門地、教育、財産又は収入によつて差別してはならない。).

rule(44, 議員資格, [by(法律)]).
rule(44, 選挙人資格, [by(法律)]).
rule(44, 議員, [not(差別(by(人種), by(信条), by(性別), by(社会的身分), by(門地), by(教育), by(財産), by(収入)))]).
rule(44, 選挙人, [not(差別(by(人種), by(信条), by(性別), by(社会的身分), by(門地), by(教育), by(財産), by(収入)))]).

%--------------------------------------------------------------------
text(45, 衆議院議員の任期は、四年とする。但し、衆議院解散の場合には、その期間満了前に終了する。).

rule(45, 任期(衆議院議員), [def(４年), def(終了(期間満了前(case(衆議院解散))))]).

%--------------------------------------------------------------------
text(46, 参議院議員の任期は、六年とし、三年ごとに議員の半数を改選する。).

rule(46, 任期(参議院議員), [def(６年), def(改選(議員の半数(３年ごと)))]).

%--------------------------------------------------------------------
text(47, 選挙区、投票の方法その他両議院の議員の選挙に関する事項は、法律でこれを定める。).

rule(47, 選挙に関する事項, [def(選挙区), def(投票の方法), by(法律)]).

%--------------------------------------------------------------------
text(48, 何人も、同時に両議院の議員たることはできない。).

rule(48, すべての人, [can_not(兼職(両議院議員))]).

%--------------------------------------------------------------------
text(49, 両議院の議員は、法律の定めるところにより、国庫から相当額の歳費を受ける。).

rule(49, 両議院議員, [receive(歳費(国庫, by(法律)))]).

%--------------------------------------------------------------------
text(50, 両議院の議員は、法律の定める場合を除いては、国会の会期中逮捕されず、会期前に逮捕された議員は、その議院の要求があれば、会期中これを釈放しなければならない。).

rule(50, 両議院議員, [not(逮捕(extent(法律), case(会期中(国会))))]).
rule(50, 議員(会期前に逮捕), [shall(釈放(会期中, by(その議院の要求)))]).

%--------------------------------------------------------------------
text(51, 両議院の議員は、議院で行つた演説、討論又は表決について、院外で責任を問はれない。).

rule(51, 両議院議員, [no_res(議院で行った演説(on(院外))), no_res(議院で行った討論(on(院外))), no_res(議院で行った表決(on(院外)))]).

%--------------------------------------------------------------------
text(52, 国会の常会は、毎年一回これを召集する。).

rule(52, 常会(国会), [def(召集(毎年一回))]).

%--------------------------------------------------------------------
text(53, 内閣は、国会の臨時会の召集を決定することができる。いづれかの議院の総議員の四分の一以上の要求があれば、内閣は、その召集を決定しなければならない。).

rule(53, 内閣, [can(決定(召集(臨時会(国会)))), shall(決定(召集(臨時会(国会)), case(要求(四分の一以上(いずれかの議院の総議員)))))]).

