String travelSuggestion(double travelAmount) {
  if (travelAmount == 0) {
    return "Yayy! No carbon footprints.";
  } else if (travelAmount <= 40) {
    return "Consider using public transportation and opt for energy efficient or hybrid vehicles.";
  } else if (40 < travelAmount && travelAmount < 80) {
    return "Combine trips to reduce the number of journeys. Explore electric or hybrid vehicle options.";
  } else if (80 < travelAmount && travelAmount < 120) {
    return "Prioritize public transportation, carpooling, or biking.Evaluate the feasibility of remote work or virtual meetings.";
  } else {
    return "Your footprint is very high. Try implementing all possible measures to reduce footprint.";
  }
}

String energySuggestion(double energyAmount) {
  if (energyAmount == 0) {
    return "Yayy! No carbon footprints.";
  } else if (energyAmount <= 13.5) {
    return "Use energy-efficient appliances. Consider renewable energy sources like solar panels.";
  } else if (13.5 < energyAmount && energyAmount < 25) {
    return "Conserve energy by turning off lights and electronics.Explore energy-efficient home upgrades.";
  } else if (25 < energyAmount && energyAmount < 35) {
    return "Prioritize energy conservation measures. Invest in renewable energy sources to reduce reliance on fossil fuels.";
  } else {
    return "Your footprint is very high. Try implementing all possible measures to reduce footprint.";
  }
}

String foodSuggestion(double foodAmount) {
  if (foodAmount == 0) {
    return "Yayy! No carbon footprints.";
  } else if (foodAmount <= 5) {
    return "Choose locally produced, seasonal, and plant-based foods. Minimize food waste by planning meals.";
  } else if (5 < foodAmount && foodAmount < 10) {
    return "Balance meat consumption with plant-based options. Support local farmers and sustainable agricultural practices.";
  } else if (10 < foodAmount && foodAmount < 20) {
    return "Shift towards a plant-based diet. Minimize processed and packaged food consumption.";
  } else {
    return "Your footprint is very high. Try implementing all possible measures to reduce footprint.";
  }
}

String otherSuggestion(double otherAmount) {
  if (otherAmount == 0) {
    return "Yayy! No carbon footprints.";
  } else if (otherAmount <= 50) {
    return "Practice recycling and reducing waste. Choose products with minimal packaging.";
  } else if (50 < otherAmount && otherAmount < 100) {
    return "Reduce water usage and adopt eco-friendly habits. Support brands with sustainable practices.";
  } else if (100 < otherAmount && otherAmount < 150) {
    return "Implement extensive waste reduction measures. Advocate for sustainable practices in daily activities.";
  } else {
    return "Your footprint is very high. Try implementing all possible measures to reduce footprint.";
  }
}
