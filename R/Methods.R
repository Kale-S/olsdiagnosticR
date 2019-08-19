# set the class name and its representation is a list
setClass('isnormalr', representation('list'))

# Show method
setMethod('show', 'isnormalr', function(object){

  cat('==========================================================================\n')
  cat('---------------- Summary table for the residual analysis -----------------\n')
  cat('==========================================================================\n')

  cat('\n\nNormal Assumption\n')
  cat(' ', object$Normality_Test$Shapiro.Wilk$method, '\n')
  cat('  \n   statistics\t degrees\t p.value\t reject H0?\n')
  cat('  ', round(object$Normality_Test$Shapiro.Wilk$statistic, 4), '\t\t\t',
      round(object$Normality_Test$Shapiro.Wilk$p.value, 5), '\t', ifelse(
        object$Normality_Test$Shapiro.Wilk$p.value < 0.05, 'Reject HO',
        'Don´t reject H0'
      ))

  cat('\n\n\nMultikolonarity\n')
  cat(' ', 'Variance Inflation Factor\n')
  cat(ifelse(sum(object$Multikolonarity$VIF >= 2) >= 1,
      '\n  There are VIF that are larger then 2, that is an indicator \n  for multikolonarity in the data',
      '\n  There is no VIF > 2, that is an indicator for \nno multikolonarity in the data'))

  cat('\n\n\nMultikolonarity\n')
  cat(' ', object$Homoskedasticity$Breusch.Pagan$method, '\n')
  cat('  \n   statistics\t degrees \t p.value\t reject H0?\n')
  cat('  ', round(object$Homoskedasticity$Breusch.Pagan$statistic, 4), '\t',
      round(object$Homoskedasticity$Breusch.Pagan$parameter, 4), '\t\t',
      round(object$Homoskedasticity$Breusch.Pagan$p.value, 5), '\t', ifelse(
        object$Homoskedasticity$Breusch.Pagan$p.value < 0.05, 'Reject HO',
        'Don´t reject H0'
      ))

  cat('\n\n\n==========================================================================\n')
  cat('--------------------------------------------------------------------------\n')
  cat('==========================================================================\n')

  print(object$Plots$QQ.Plot)
  print(object$Plots$Residual.Hist)
  print(object$Plots$Regressor.Hist)
  print(object$Plots$Box.Plot)
  print(object$Plots$Cooks.Distance.plot)
  print(object$Plots$Bubble.Plot)
})

