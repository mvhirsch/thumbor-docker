<?php

$images = [
	'https://github.com/thumbor/thumbor/raw/master/example.jpg',
	'https://github.com/thumbor/thumbor/raw/master/docs/images/dice_transparent_background.png',
	'https://www.autoracing.com.br/wp-content/uploads/2023/03/F1-leclerc-australia-2023-treinos-sexta.jpg',
	'https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Turkish_Van_Cat.jpg/546px-Turkish_Van_Cat.jpg',
];
$images_filters = [
	'filters:autojpg()',
	'filters:background_color(f00)',
	'filters:blur(7)',
	'filters:brightness(40)',
	'filters:contrast(40)',
	'filters:convolution(1;2;1;2;4;2;1;2;1,3,true)',
	'filters:cover()',
	'filters:equalize()',
	'filters:extract_focal()',
	'filters:fill(f00)',
	'filters:focal(146x206:279x360)',
	'filters:format(webp)',
	'filters:grayscale()',
	'filters:max_bytes(7500)',
	'filters:noise(40)',
	'filters:proportion(0.5)',
	'filters:quality(40)',
	'filters:rgb(20,-20,40)',
	'filters:rotate(90)',
	'filters:round_corner(20|40,255,255,255)',
	'filters:saturation(40)',
	'filters:sharpen(2,1.0,true)',
	'filters:stretch()',
	'filters:watermark(https://upload.wikimedia.org/wikipedia/commons/3/31/Wiki_logo_Nupedia.jpg,10,10,20,30,30)',
	'smart'
];


$gifs = [
	'https://www.litmus.com/wp-content/uploads/2021/02/ease-applied-to-tween-with-bouncein-example.gif',
	'https://i.imgur.com/1THykVa.gif',
	'https://i.imgur.com/eTTzjIz.gif',
];
$gifs_filters = [
	'filters:stretch()',
	'smart',
	'filters:gifv()',
	'filters:gifv(mp4)',
	'filters:gifv(webm)'
];
?>

<h1>Images</h1>

<?php
foreach ($images_filters as $filter) { ?>

	<h2><?php echo $filter ?></h2>
	<table>
		<?php
		foreach ($images as $image) {
			if ($filter == 'filters:fill(f00)') {
				$size = 'fit-in/200x350';
			} else {
				$size = '200x150';
			}

		?>
			<td>
				<img src="http://localhost:8888/unsafe/<?php echo $size; ?>/<?php echo $filter; ?>/<?php echo $image; ?>" />
			</td>
		<?php }
		?>
	</table>
<?php
} ?>

<h1>Gifs/Videos</h1>

<?php
foreach ($gifs_filters as $filter) { ?>
	<h2><?php echo $filter ?></h2>
	<table>
		<?php
		foreach ($gifs as $gif) {
			if ($filter == 'filters:gifv()' || $filter == 'filters:gifv(mp4)' || $filter == 'filters:gifv(webm)') {
				if (strpos($gif, '.gif') !== false) { ?>
					<td>
						<video width="200" height="200" controls>
							<source src="http://localhost:8888/unsafe/<?php echo $size; ?>/<?php echo $filter; ?>/<?php echo $gif; ?>" type="video/mp4">
						</video>
					</td>
				<?php }
			} else { ?>
				<td>
					<img src="http://localhost:8888/unsafe/<?php echo $size; ?>/<?php echo $filter; ?>/<?php echo $gif; ?>" />
				</td>
		<?php }
		}
		?>
	</table>
<?php
}
