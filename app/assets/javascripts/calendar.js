'use strict';

console.clear();

{
  const today = new Date();//今日の日付から取得
  let year = today.getFullYear();
  let month = today.getMonth();

  function getCalendarHead(){
    const dates = [];
    const d = new Date(year,month, 0).getDate();
    const n = new Date(year,month, 1).getDay();

    for (let i = 0; i < n; i++){
      // 30
      // 29, 30
      // 28, 29, 30
      dates.unshift({
        date: d - i,
        isToday:false,
        isDisabled:true,
      });
    }

    return dates;

  }

  function getCalendarBody(){
    const dates = [];//date:日付、day:曜日
    const lastDate = new Date(year,month + 1, 0).getDate();//翌月の0日目を指定することで今月の末日を得られる

    for (let i = 1; i <= lastDate; i++){
      dates.push({
        date: i,
        isToday:false,
        isDisabled:false,
      });
    }

    //年と月と同じであれば本日を太字にする
    if (year === today.getFullYear() && month === today.getMonth()){
    //datesのisToday:falseにしているので本日だけtrueに書換
    dates[today.getDate() - 1].isToday = true; //日付は0から始まるため-1する
    }


    return dates;
  }

  function getCalendarTail(){
    const dates = [];
    const lastDay = new Date(year,month + 1, 0).getDay();

    for(let i = 1; i < 7 - lastDay; i++){
      dates.push({
        date: i,
        isToday:false,
        isDisabled:true,
      });
    }
    return dates;
  }

  function clearCalendar(){
    //カレンダーを描画する際に描画している内容をリセットする
    const tbody = document.querySelector('tbody');
    //tbodyにこ要素が有る限り削除
    while (tbody.firstChild){
      tbody.removeChild(tbody.firstChild);
    }
  }
  function rendarTitle(){
    //表示する月を変更/padStartで2桁表示で1桁の場合は0で埋める
    const title =`${year}/${String(month + 1).padStart(2,'0')}`;
    document.getElementById('title').textContent = title;
  }
  function renderWeeks(){
    const dates = [
      ...getCalendarHead(),
      ...getCalendarBody(),
      ...getCalendarTail(),
    ];

    const weeks = [];
    const weeksCount = dates.length / 7;

    for(let i = 0; i < weeksCount; i++){
      weeks.push(dates.splice(0, 7));
    }

    weeks.forEach(week => {
      const tr = document.createElement('tr');
      week.forEach(date => {
        const td = document.createElement('td');

        td.textContent = date.date;
        if(date.isToday){
          td.classList.add('today');
        }
        if(date.isDisabled){
          td.classList.add('disabled');
        }

        tr.appendChild(td);
      });
      document.querySelector('tbody').appendChild(tr);
    });
  }

  function createCalendar(){
    clearCalendar();
    rendarTitle();
    renderWeeks();

  }
  //prevをクリック=>月から1を引く、0より小さい場合は年から1引く、11（0から12番目）
  document.getElementById('prev').addEventListener('click',() => {
    month--;
    if(month<0){
      year--;
      month = 11;
    }
    createCalendar();//カレンダーを再描画
  });
  document.getElementById('next').addEventListener('click',() => {
    month++;
    if(month>11){
      year++;
      month = 0;
    }
    createCalendar();
  });
  //todayクリックで本日のところに飛ぶ
  document.getElementById('today').addEventListener('click',() => {
    year = today.getFullYear();
    month = today.getMonth();
    createCalendar();
  });
  createCalendar();

}
