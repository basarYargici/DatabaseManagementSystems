<html>
<head>
	<style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
	</style>
</head>
<body>
    <?php

    switch (@ $_GET['is']) {
        case 'artistGuncelle':
            artistGuncelle($_GET['id'], $_GET['name'], $_GET['gender'], $_GET['status'], $_GET['field']);
            artistListele();
            break;
        case 'artistSil':
            artistSil($_GET['id']);
            artistListele();
            break;
        case 'artistListele':
            artistListele();
            break;
        case 'artistEklemeFormu':
            artistEklemeFormu();
            break;
        case 'artistGuncellemeFormu':
            artistGuncellemeFormu();
            break;
        case 'artistEkle':
            artistEkle($_GET['id'], $_GET['name'], $_GET['gender'], $_GET['status'], $_GET['field']);
            artistListele();
            break;
        default:
            artistListele();
    }
    exit;

    function artistGuncelle($id, $name, $gender, $status, $field)
    {
        $sql = "UPDATE artist2 SET name='$name', gender='$gender', status='$status', field=$field WHERE id=$id;";
        echo "<br/>SQL: $sql<br/>";
        $baglanti = mysqli_connect('localhost', 'root', '', 'school');
        if (!$baglanti)
            exit(mysqli_error($baglanti));
        $sonuc = mysqli_query($baglanti, $sql);
        if (!$sonuc)
            exit(mysqli_error($baglanti));
    }

    function artistSil($id)
    {
        $sql = "DELETE FROM artist2 WHERE id=$id;";
        //echo "<br/>SQL: $sql<br/>";
        $baglanti = mysqli_connect('localhost', 'root', '', 'school');
        if (!$baglanti)
            exit(mysqli_error($baglanti));
        $sonuc = mysqli_query($baglanti, $sql);
        if (!$sonuc)
            exit(mysqli_error($baglanti));
    }

    function artistEkle($id, $name, $gender, $status, $field)
    {
        $sql = "INSERT INTO artist2 VALUES($id, '$name', '$gender', '$status', '$field');";
        echo "<br/>SQL: $sql<br/>";
        $baglanti = mysqli_connect('localhost', 'root', '', 'school');
        if (!$baglanti)
            exit(mysqli_error($baglanti));
        $sonuc = mysqli_query($baglanti, $sql);
        if (!$sonuc)
            exit(mysqli_error($baglanti));
    }

    function artistEklemeFormu($no = null)
    {

        $baglanti = mysqli_connect('localhost', 'root', '', 'school');
        if ($no) { // veritabanından ogrenci kaydını getir
            $sql = "SELECT * FROM artist2 WHERE sid=$no;";
            $kayitKumesi = mysqli_query($baglanti, $sql);
            echo "$sql<br>";
            $ogrenci = mysqli_fetch_array($kayitKumesi);
        }

        $select = "<SELECT name=field>
				<OPTION value='1'> Music </OPTION>
				<OPTION value='2'> Painting </OPTION>
				<OPTION value='3'> Calligraphy </OPTION>
         </SELECT>";

        echo @ "
			<form action='?'  method=get>
			<h3>Yeni Artist</h3>
			<table>
			<tr><td>Id</td> <td><input name=id type=text value='{$ogrenci[0]}'></td></tr>
			<tr><td>Name</td> <td><input name=name type=text  value='{$ogrenci[1]}'></td></tr>
			<tr><td>Field</td> <td>$select</td>  </tr>
			
			
			<tr><td>Gender</td> <td><input name=gender type=radio value=1 id='e1' " . (isset($ogrenci) && $ogrenci[4] == 1 ? 'checked' : '') . "> 
				<label for='e1'>M</label> 
				<input name=gender type=radio value=0 id='k1' " . (isset($ogrenci) && $ogrenci[4] == 0 ? 'checked' : '') . " > 
				<label for='k1'>F</label></td></tr>
			<tr><td> <label for='a1'>Status</label> </td> 
	    	<td> <input name=status type=checkbox value=1 id='a1' " . (isset($ogrenci) && $ogrenci[5] == 1 ? 'checked' : '')
            . "> </td></tr>
			<tr><td></td> <td><input name=a type=submit value=Create>
			</table>
			<input name=is type=hidden value='" . ('artistEkle') . "'>
			</form>";
    }

    function artistGuncellemeFormu($no = null)
    {

        $baglanti = mysqli_connect('localhost', 'root', '', 'school');
        if ($no) { // veritabanından ogrenci kaydını getir
            $sql = "SELECT * FROM artist2 WHERE sid=$no;";
            $kayitKumesi = mysqli_query($baglanti, $sql);
            echo "$sql<br>";
            $ogrenci = mysqli_fetch_array($kayitKumesi);
        }

        $select = "<SELECT name=field>
				<OPTION value='1'> Music </OPTION>
				<OPTION value='2'> Painting </OPTION>
				<OPTION value='3'> Calligraphy </OPTION>
         </SELECT>";

        echo @ "
			<form action='?'  method=get>
			<h3>Yeni Artist</h3>
			<table>
			<tr><td>Id</td> <td><input name=id type=text value='{$ogrenci[0]}'></td></tr>
			<tr><td>Name</td> <td><input name=name type=text  value='{$ogrenci[1]}'></td></tr>
			<tr><td>Field</td> <td>$select</td>  </tr>
			
			
			<tr><td>Gender</td> <td><input name=gender type=radio value=1 id='e1' " . (isset($ogrenci) && $ogrenci[4] == 1 ? 'checked' : '') . "> 
				<label for='e1'>M</label> 
				<input name=gender type=radio value=0 id='k1' " . (isset($ogrenci) && $ogrenci[4] == 0 ? 'checked' : '') . " > 
				<label for='k1'>F</label></td></tr>
			<tr><td> <label for='a1'>Status</label> </td> 
	    	<td> <input name=status type=checkbox value=1 id='a1' " . (isset($ogrenci) && $ogrenci[5] == 1 ? 'checked' : '')
            . "> </td></tr>
			<tr><td></td> <td><input name=a type=submit value=Create>
			</table>
			<input name=is type=hidden value='" . ('artistGuncelle') . "'>
			</form>";
    }

    function artistListele()
    {
        echo "<h1>Artist listesi</h1>
		<table class='table table-dark'> <thead> <tr>  <th>id</th> <th>name</th> <th></th> <th>gender</th> <th>status</th> <th>field</th> </tr></thead><tbody>";

        $baglanti = mysqli_connect('localhost', 'root', '', 'school');
        $kayitKumesi = mysqli_query($baglanti, "SELECT * FROM artist2");
        $counter = 1;
        while ($satir = mysqli_fetch_assoc($kayitKumesi)) {
            print "<tr> 
			<th>{$satir['id']}</th>  
			<th>{$satir['name']}<th> 
			<th>{$satir['gender']}</th>
			<th>{$satir['status']}</th>
			<th>{$satir['field']}</th> 
			</td></tr><br>";
            $counter++;
        }
        print "</tbody></table>";
    }

    ?>
</body>
