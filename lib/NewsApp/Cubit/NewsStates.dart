abstract class NewsStates {}

class NewsIntialStates extends NewsStates {}

class NewsBottomNavState extends NewsStates {}

class NewsLoadingBussinesState extends NewsStates {}

class NewsgetBusinessNewsSucessState extends NewsStates {}

class NewsgetBussinesErrorState extends NewsStates {
  final String error;

  NewsgetBussinesErrorState(this.error);
}

class NewsLoadingSportsState extends NewsStates {}

class NewsgetSportsNewsSucessState extends NewsStates {}

class NewsgetSportsErrorState extends NewsStates {
  final String error;

  NewsgetSportsErrorState(this.error);
}


class NewsLoadingScienceState extends NewsStates {}

class NewsgetScienceNewsSucessState extends NewsStates {}

class NewsgetScienceErrorState extends NewsStates {
  final String error;

  NewsgetScienceErrorState(this.error);
}
