// Javascript code to process results1.csv 

const fs = require("fs");
fs.readFile("results1.csv", function(err, buff) {
		//console.log(buff.toString());
		let data = [];
		data = buff.toString().trim().split("\n");
		//console.log(data);
		
		firstline = data[0];
		tokens = firstline.split(",");
		survey_code = tokens[1].trim();
		console.log(survey_code);
		
		for (let i = 2; i < data.length; i++) {
		
			//console.log(data[i]);
			tokens = data[i].trim().split(",");
			question_text = tokens[0].trim();
			answer1 = tokens[1].trim();
			answer2 = tokens[2].trim();
			answer3 = tokens[3].trim();
			answer4 = tokens[4].trim();
			answer5 = tokens[5].trim();
			console.log("select add_answers('" + survey_code + "','" + question_text + "','" + answer1 + "','" + answer2 + "','" + answer3 + "','" + answer4 + "','" + answer5 + "');");
		}
});

const fs = require("fs");
fs.readFile("results2.csv", function(err, buff) {
		//console.log(buff.toString());
		let data = [];
		data = buff.toString().trim().split("\n");
		//console.log(data);
		
		firstline = data[0];
		tokens = firstline.split(",");
		survey_code = tokens[1].trim();
		console.log(survey_code);
		
		for (let i = 2; i < data.length; i++) {
		
			//console.log(data[i]);
			tokens = data[i].trim().split(",");
			question_text = tokens[0].trim();
			answer1 = tokens[1].trim();
			answer2 = tokens[2].trim();
			answer3 = tokens[3].trim();
			answer4 = tokens[4].trim();
			answer5 = tokens[5].trim();
			console.log("select add_answers('" + survey_code + "','" + question_text + "','" + answer1 + "','" + answer2 + "','" + answer3 + "','" + answer4 + "','" + answer5 + ");");
		}
});
