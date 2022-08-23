module ArticlesHelper
  def month_day(datetime)
    datetime.strftime('%B %e, %Y')
  end
end
