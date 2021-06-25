<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
</head>
<body>
<div id="grid"></div>
<script type="text/javascript">
const gridData = [
    {
      name: 'Beautiful Lies',
      artist: 'Birdy',
      release: '2016.03.26',
      type: 'Deluxe',
      genre: 'Pop'
    },
    {
      name: 'X',
      artist: 'Ed Sheeran',
      release: '2014.06.24',
      type: 'Deluxe',
      genre: 'Pop',
      _attributes: {
        disabled: true // A current row is disabled
      }
    },
    {
      name: 'Moves Like Jagger',
      release: '2011.08.08',
      artist: 'Maroon5',
      type: 'Single',
      genre: 'Pop,Rock',
      _attributes: {
        checkDisabled: true // A checkbox is disabled only
      }
    },
    {
      name: 'A Head Full Of Dreams',
      artist: 'Coldplay',
      release: '2015.12.04',
      type: 'Deluxe',
      genre: 'Rock',
      _attributes: {
        checked: true, // A checkbox is already checked while rendering
        className: {
          // Add class name on a row
          row: ['red']
        }
      }
    },
    {
      name: '19',
      artist: 'Adele',
      release: '2008.01.27',
      type: 'EP',
      genre: 'Pop,R&B',
      _attributes: {
        rowSpan: {
          // Merge rows
          artist: 3,
          genre: 2
        }
      }
    },
    {
      name: '21',
      artist: 'Adele',
      release: '2011.01.21',
      type: 'Deluxe',
      genre: 'Pop,R&B'
    },
    {
      name: '25',
      artist: 'Adele',
      release: '2015.11.20',
      type: 'EP',
      genre: 'Pop',
      _attributes: {
        className: {
          // Add class name on each columns
          column: {
            type: ['blue'],
            genre: ['blue']
          }
        }
      }
    }
  ];

function createGrid() {
	return new tui.Grid({
    el: document.getElementById('grid'),
    data: gridData,
    scrollX: false,
    scrollY: false,
    rowHeaders: ['checkbox'],
    columns: [
      {
        header: 'Name',
        name: 'name',
        editor: 'text'
      },
      {
        header: 'Artist',
        name: 'artist'
      },
      {
        header: 'Type',
        name: 'type'
      },
      {
        header: 'Release',
        name: 'release'
      },
      {
        header: 'Genre',
        name: 'genre'
      }
    ],columnOptions: {
      frozenCount: 1,
      frozenBorderWidth: 2,
      minWidth: 300
    }
  });
} 
  grid.on('check', ev => {
      console.log('check!', ev);
    });

    grid.on('uncheck', ev => {
      console.log('uncheck!', ev);
    });

    grid.on('focusChange', ev => {
      console.log('change focused cell!', ev);
    });

</script>
</body>
</html>