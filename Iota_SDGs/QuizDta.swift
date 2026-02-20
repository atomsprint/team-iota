//
//  QuizDta.swift
//  Iota_SDGs
//
//  Created by 永田　花道 on 2026/02/17.
//

import Foundation

struct Quiz {
    let question: String
    let answer: Bool
    let comment: String
    
}

let quizlist = [
    Quiz(
        question: "マイクロプラスチックとは、5mm以下の小さなプラスチックのことである。",
        answer: true,
        comment: "5cmではなく5mm以下を指します。海の生き物が食べてしまうのが問題です。"
    ),
    Quiz(
        question: "世界には、今日食べるものにも困っている「飢餓」の状態にある人が7億人以上いる。",
        answer: true,
        comment: "紛争や気候変動により、多くの人が深刻な食料不足に直面しています。"
    ),
    Quiz(
        question: "世界で作られる食べ物の総量は、全人類が食べるのに十分な量がある。",
        answer: true,
        comment: "量は足りていますが、先進国の廃棄や途上国への分配の不備が原因で飢餓が起きています。"
    ),
    Quiz(
        question: "給食を残さず食べることも、世界の飢餓をなくす活動につながる。",
        answer: true,
        comment: "食品ロスを減らすことは、資源の無駄遣いを防ぐSDGsの重要な一歩です。"
    ),
    Quiz(
        question: "教育を受けることは、貧困から抜け出すための大きな助けになる。",
        answer: true,
        comment: "知識や技術を身につけることで、安定した仕事に就ける可能性が高まります。"
    ),
    Quiz(
        question: "カカオを収穫しているアフリカの農家の人たちは、みんなチョコレートの味を知っている。",
        answer: false,
        comment: "チョコは高級品のため、原料を作っていても食べたことがない農家が多く存在します。"
    ),
    Quiz(
        question: "日本は平和なので、SDGs（持続可能な開発目標）は私たちには関係がない。",
        answer: false,
        comment: "ジェンダー平等やエネルギー問題など、日本にも解決すべき課題はたくさんあります。"
    ),
    Quiz(
        question: "2030年までのSDGs達成は、今のペースのままだと非常に難しいと言われている。",
        answer: true,
        comment: "目標達成には、国や企業、そして私たち一人ひとりのさらなる努力が必要です。"
    ),
    Quiz(
        question: "お腹がいっぱいになったら、食べ物を捨てても良い。",
        answer: false,
        comment: "「つくる責任 つかう責任」として、食べ物を大切にすることが求められています。"
    ),
    Quiz(
        question: "再生可能エネルギー（太陽光や風力など）の割合を増やすことが、2030年までの目標に含まれている。",
        answer: true,
        comment: "地球温暖化を防ぐため、クリーンなエネルギーへの転換が急がれています。"
    )
]
