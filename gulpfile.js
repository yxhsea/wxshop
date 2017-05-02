// var elixir = require('laravel-elixir');
//
// /*
//  |--------------------------------------------------------------------------
//  | Elixir Asset Management
//  |--------------------------------------------------------------------------
//  |
//  | Elixir provides a clean, fluent API for defining some basic Gulp tasks
//  | for your Laravel application. By default, we are compiling the Sass
//  | file for our application, as well as publishing vendor resources.
//  |
//  */
//
// elixir(function(mix) {
//     mix.sass('app.scss');
// });


var gulp = require('gulp');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var minifyCss = require('gulp-minify-css');
var rename = require('gulp-rename');
// var imagemin = require('gulp-imagemin');

// 合并 css 并压缩
gulp.task('package-css', function() {
  return gulp.src(['public/css/weui.css', 'public/css/swipe.css', 'public/css/book.css'])
    .pipe(concat('book.css'))
    .pipe(minifyCss())
    .pipe(rename('book.min.css'))
    .pipe(gulp.dest('public/build'));
});

// 压缩 js
gulp.task('package-js', function() {
  return gulp.src(['public/js/jquery-1.11.2.min.js', 'public/js/swipe.min.js', 'public/js/book.js'])
    .pipe(concat('book.js'))
    .pipe(uglify())
    .pipe(rename('book.min.js'))
    .pipe(gulp.dest('public/build'));
});

// 移动图片
gulp.task('package-images1', function() {
  return gulp.src('images/*')
    .pipe(gulp.dest('build/images'));
});


// 工作流启动
gulp.task('default', ['package-css', 'package-js'], function() {
  // 将你的默认的任务代码放在这

});

gulp.task('css', ['package-css'], function() {
  // 将你的默认的任务代码放在这

});

gulp.task('js', ['package-js'], function() {
  // 将你的默认的任务代码放在这

});
