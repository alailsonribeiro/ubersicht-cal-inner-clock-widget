#CONFIG
refreshFrequency: 3600000               # 1 hour in milliseconds (default)
i18n = "ko_KR"                          # Default language
FirstWeekDay = 1                        # 0 = Sunday OR 1 = Monday
TimeZone = 'America/Sao_Paulo'          #Timezone

#Language defaults  (pt_BR, en_US, es_ES, fr_FR, de_DE, it_IT, ru_RU, zh_CN, ja_JP)
WeekDays = { 
  pt_BR: {
    short:['Dº','2ª','3ª','4ª','5ª','6ª','Sª'],
    sfirst: ['2ª','3ª','4ª','5ª','6ª','Sª','Dº'],
    long:['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado']
  },
  en_US: {
    short:['Su','Mo','Tu','We','Th','Fr','Sa'],
    sfirst: ['Mo','Tu','We','Th','Fr','Sa','Su'],
    long:['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
  },
  es_ES: {
    short:['D','L','M','X','J','V','S'],
    sfirst: ['L','M','X','J','V','S','D'],
    long:['Domingo','Lunes','Martes','Miércoles','Jueves','Viernes','Sábado']
  },
  fr_FR: {
    short:['D','L','M','M','J','V','S'],
    sfirst: ['L','M','M','J','V','S','D'],
    long:['Dimanche','Lundi','Mardi','Mercredi','Jeudi','Vendredi','Samedi']
  },
  de_DE: {
    short:['S','M','D','M','D','F','S'],
    sfirst: ['M','D','M','D','F','S','S'],
    long:['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag']
  },
  it_IT: {
    short:['D','L','M','M','G','V','S'],
    sfirst: ['L','M','M','G','V','S','D'],
    long:['Domenica','Lunedì','Martedì','Mercoledì','Giovedì','Venerdì','Sabato']
  },
  ru_RU: {
    short:['В','П','В','С','Ч','П','С'],
    sfirst: ['П','В','С','Ч','П','С','В'],
    long:['Воскресенье','Понедельник','Вторник','Среда','Четверг','Пятница','Суббота']
  },
  zh_CN: {
    short:['日','一','二','三','四','五','六'],
    sfirst: ['一','二','三','四','五','六','日'],
    long:['星期日','星期一','星期二','星期三','星期四','星期五','星期六']
  },
  ja_JP: {
    short:['日','月','火','水','木','金','土'],
    sfirst: ['月','火','水','木','金','土','日'],
    long:['日曜日','月曜日','火曜日','水曜日','木曜日','金曜日','土曜日']
  },
  ko_KR: {
    short:['일','월','화','수','목','금','토'],
    sfirst: ['월','화','수','목','금','토','일'],
    long:['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
  },
  ar_AR: {
    short:['ح','ن','ث','ر','خ','ج','س'],
    sfirst: ['ن','ث','ر','خ','ج','س','ح'],
    long:['الأحد','الاثنين','الثلاثاء','الأربعاء','الخميس','الجمعة','السبت']
  },
  tr_TR: {
    short:['P','P','S','Ç','P','C','C'],
    sfirst: ['P','S','Ç','P','C','C','P'],
    long:['Pazar','Pazartesi','Salı','Çarşamba','Perşembe','Cuma','Cumartesi']
  },
  nl_NL: {
    short:['Z','M','D','W','D','V','Z'],
    sfirst: ['M','D','W','D','V','Z','Z'],
    long:['Zondag','Maandag','Dinsdag','Woensdag','Donderdag','Vrijdag','Zaterdag']
  },
  pl_PL: {
    short:['N','P','W','Ś','C','P','S'],
    sfirst: ['P','W','Ś','C','P','S','N'],
    long:['Niedziela','Poniedziałek','Wtorek','Środa','Czwartek','Piątek','Sobota']
  },
  sv_SE: {
    short:['S','M','T','O','T','F','L'],
    sfirst: ['M','T','O','T','F','L','S'],
    long:['Söndag','Måndag','Tisdag','Onsdag','Torsdag','Fredag','Lördag']
  },
}


# CLOCK

showTime = ->
  time = new Date
  hour = time.getHours()
  min = time.getMinutes()
  sec = time.getSeconds()
  wday = WeekDays[i18n].short[time.getDay()]

  hour = if hour < 10 then '0' + hour else hour
  min = if min < 10 then '0' + min else min
  sec = if sec < 10 then '0' + sec else sec
  currentTime = '<span class="hour-min">' + hour  + ':' + min + '</span>' + '<div class="clock-inf"><span class="wday">' + wday + '</span></div>'
  document.getElementById('clock').innerHTML = currentTime
  return

setTimeout showTime, 1000

setInterval showTime, 30000

# CALENDAR

CalCommand = ['cal -h && date "+%-m %-d %y"',
'cal -h | awk \'{ print " "$0; getline; print "2ª 3ª 4ª 5ª 6ª Sª Dº"; \
getline; if (substr($0,1,2) == " 1") print "                    1 "; \
do { prevline=$0; if (getline == 0) exit; print " " \
substr(prevline,4,17) " " substr($0,1,2) " "; } while (1) }\' && date "+%-m %-d %y"']

command: CalCommand[FirstWeekDay ? 1]

 # Show other months days | default: true | NOT CHANGE THIS LINE TO TOP FROM HERE
otherMonths: true                       
 # Show other months days | default: true | NOT CHANGE THIS LINE TO TOP FROM HERE

# STYLES DEFINITION
style: """
  top: 47%
  left: 20px
  color: #fff
  
  #clock
    font-weight: 500 
    opacity: 0.7
    font-family: monospace
    display: flex
    align-items: center
    gap: 15px
    position: relative
    justify-content: center

  .wday 
    border-radius: 12px
    text-align: center
    font-size: 2em
    font-weight: 500
    padding: 1px
    color: yellow
    border: 1px solid #fff
    background: rgba(#000, 0.5)

  .hour-min
    font-size: 8em
    color: #fff

  .clock-inf
    display: grid
    font-size: 3.5em
    line-height: 1
    color: white

  .dataextenso {
    font-size: 1vw
    text-align: center
    color: #fff
  }
   
  table
    min-width: 100%
    border-collapse: collapse
    table-layout: fixed
    margin-left: auto
    opacity: 0.4
    margin-top: 15px;
    text-align: center;
    overflow:hidden;
    border-collapse:separate;
    border: solid #00000070 0px;
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    border-radius: 15px;
    background: rgba(#000, 0.7)

  td
    text-align: center
    padding: 10px
    font-family: system-ui

  tfoot td
    font-size: 1em
    font-weight: 900
    background: rgba(#000, 0.7)
    border-radius: 12px

  thead tr
    &:first-child td
      font-size: 2em
      font-weight: 200
      opacity: 1

    &:last-child td
      font-size: 1rem
      padding-bottom: 1px 
      font-weight: 500 

  tbody td
     font-weight: 400 

  .today
    font-weight: bold
    font-size: 1.7em !important
    padding: 5px !important
    color: yellow
    border-radius: 50%
    box-shadow: 0 0 0 1px #fff
    background: rgba(#000, 0.5)
    border-radius: 12px

  .weekend
    font-weight: 300
    color: #fff
    padding: 5px 5px
    background: rgba(#000, 0.3)

  .grey
    color: black
    background: rgba(#fff, 0.2)
    opacity: 0.7
    font-weight: bold
    
  hr
    border: 0
    border-top: 1px solid #fff
    opacity: 0.1
    margin: 10px 0 0px 0
"""

# RENDER BASE HTML TO CALENDAR AND CLOCK ON SCREEN
render: -> """
  <table>
    <thead>
    </thead>
    <tbody>
    </tbody>
    <tfoot>
      <tr><td colspan='7'><div id="clock"></div></td></tr>
    </tfoot>
  </table>
  
"""

# RENDER HEADER OF CALENDAR
updateHeader: (rows, table) ->
  thead = table.find("thead")
  thead.empty()

  time = new Date

  wday =  WeekDays[i18n].long[time.getDay()]

  mesano=time.toLocaleDateString( i18n.split('_').join('-'), {  day: 'numeric', month: 'long', year: 'numeric', timeZone: TimeZone })
  thead.append "<tr class='dataextenso'><td colspan='7'>#{wday}, #{mesano}</td></tr>"
  tableRow = $("<tr class='weekend'></tr>").appendTo(thead)
  daysOfWeek = [WeekDays[i18n].short,WeekDays[i18n].sfirst][FirstWeekDay]
  
  itime = [time.getDay(), time.getDay() - 1][FirstWeekDay]

  for dayOfWeek, i in daysOfWeek
      if i == itime
        tableRow.append "<td class='today'><span>#{dayOfWeek}</span></td>"
      else
        if i > 4 
          tableRow.append "<td class='weekend'><span>#{dayOfWeek}</span></td>"
        else
          tableRow.append "<td>#{dayOfWeek}</td>"

# RENDER BODY OF CALENDAR
updateBody: (rows, table) ->
  #Set to 1 to enable previous and next month dates, 0 to disable
  PrevAndNext = 1

  tbody = table.find("tbody")
  tbody.empty()

  rows.splice 0, 2
  rows.pop()

  today = rows.pop().split(/\s+/)
  month = today[0]
  date = today[1]
  year = today[2]

  lengths = [31, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30]
  if year%4 == 0
    lengths[2] = 29

  for week, i in rows
    days = week.split(/\s+/).filter((day) -> day.length > 0)
    tableRow = $("<tr></tr>").appendTo(tbody)

    if i == 0 and days.length < 7
      for j in [days.length...7]
        if @otherMonths == true
          k = 6 - j
          cell = $("<td>#{lengths[month-1]-k}</td>").appendTo(tableRow)
          cell.addClass("grey")
        else
          cell = $("<td></td>").appendTo(tableRow)

    pw = 0
    for day in days
      day = day.replace(/\D/g, '')
      #console.log(pw)
      if pw > 4
        # destacar o fim de semana 
        cell = $("<td>#{day}</td>").appendTo(tableRow)
        cell.addClass("weekend")
      else
        cell = $("<td>#{day}</td>").appendTo(tableRow)
      if pw > 5 
        pw = 0
      else
        pw++
      # destacar o dia de hoje  
      cell.addClass("today") if day == date
  
    if i != 0 and 0 < days.length < 7 and @otherMonths == true
      for j in [1..7-days.length]
        cell = $("<td>#{j}</td>").appendTo(tableRow)
        cell.addClass("grey")


update: (output, domEl) ->
  rows = output.split("\n")
  table = $(domEl).find("table")

  @updateHeader rows, table
  @updateBody rows, table