

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
        function checkId() {
        	if($("#id").val()==""){
                alert("아이디를 입력 해주세요.");
                $("#id").focus();
                return;
        	}
        	var params = { id : $("#id").val() }
        	$.ajax({
        		url: "${path2 }/member/idCheck.do?id="+$("#id").val(),
    			type: "get",
    			dataType: "json",
    			//data : "params",
    			success:function(result){
    				console.log(result.data);
                    var idChk = result.data;	//true 또는 false를 받음
                    if(idChk == false){	//사용할 수 없는 아이디
                        $("#idck").val("no");
                        $("#msg").html("<strong style='color:red'>이미 사용중인 아이디가 있습니다.</strong>");
                        $("#id").focus();
                    } else if(idChk == true){	//사용 가능한 아이디
                        $("#idck").val("yes");
                        $("#msg").html("<strong style='color:white'>사용가능한 아이디 입니다.</strong>");
                    } else if(idck==""){
                        $("#msg").html("<strong>아이디가 확인되지 않았습니다. 다시 시도해주시기 바랍니다.</strong>");
                    }
    			}
        	});
        }
        
        function joinCheck(f){
            if(f.pw.value!=f.pw2.value){
                alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                f.pw.focus();
                return false;
            }
            if(f.idck.value!="yes"){
                alert("아이디 중복 체크를 하지 않으셨습니다.");
                return false;
            }
        }
        
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