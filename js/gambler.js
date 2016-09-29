onmessage = function(e){
	var money = Number(e.data.money);
	var bet = Number(e.data.bet);
	var rounds = 0;
	while (money > 0 && money <= 2000000000) {
		rounds++;
		_bet = (bet > money ? money : bet);
		money += (Math.random() < 0.5 ? -_bet : _bet);
	}
	postMessage({money:money, rounds:rounds});
}
