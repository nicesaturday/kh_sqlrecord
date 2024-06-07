
        
        // 로그인 , 가입 클릭시 
        document.querySelector('.img__btn').addEventListener('click', function() {
            document.querySelector('.cont').classList.toggle('s--signup');
        });


        //팝업창
        $(document).ready(function(){
            $(".infofound").click(function(event){
                event.preventDefault();
                $(".tab_content").addClass("active");
            });
            
            $(".pop_clo").click(function(event){
                event.preventDefault();
                $(".tab_content").removeClass("active");
            });

        });

        //회원가입
        
        
        
        
        //우편번호 검색
        function searchpostcode() {
        	new daum.Postcode({
                oncomplete: function(data) {
                    console.log(data);
                    var roadAddr = data.roadAddress;
                    var jibunAddr = data.jibunAddress;
                    document.getElementById("postcode").value = data.zonecode;
                    if(roadAddr !== '') {
                        document.getElementById("addr1").value = roadAddr;
                    } else if(jibunAddr !== ''){
                        document.getElementById("addr1").value = jibunAddr;
                    }
                    document.getElementById("addr2").focus();
                }
            }).open();
        }
    
        
        //가입시 태그 선택 DB에 저장
        function getSelectTgas() {
            var selectTgas = [];
            var checkboxes = document.querySelectorAll('input[name="genre"]:checked');
            checkboxes.forEach(function(checkbox) {
            	selectTgas.push(checkbox.value);
            });
            return selectTgas;
        }
        
        function setGenreTags() {
            var selectTgas = getSelectTgas();
            document.getElementById('tag1').value = selectTgas[0] || ''; // 첫 번째 장르를 설정
            document.getElementById('tag2').value = selectTgas[1] || ''; // 두 번째 장르를 설정
            document.getElementById('tag3').value = selectTgas[2] || ''; // 세 번째 장르를 설정
        }