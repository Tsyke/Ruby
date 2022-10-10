    require 'json'

    class AuthenticationsController < ActionController::Base
        def login
            if !request["email"] 
                puts 'error'
            elsif request["email"]
                if request["password"]
                    file = File.read('./app/assets/data/data.json')
                    new_data = JSON.parse(file)
                    
                    user = nil
                    new_data["users"].each { |users| 
                        if users['email'] === request['email']
                            user = users
                        else

                        end
                    }
                    if !user
                        redirect_to "/login?err=naf"
                    else
                        if user["password"] != request['password']
                            redirect_to "/login?err=invalid_password"
                        else
                            @session = user
                            redirect_to profile_path(@session, status: :see_other )
                        end
                    end
                else
                    puts 'error'
                end
            end
        end
        def register
            if request["email"] && request["password"] && request["name"] && request["firstname"] && request["birtday"] && request["tel"]
                file = File.read('./app/assets/data/data.json')
                new_data = JSON.parse(file)
                jsondata2 = { 
                    "email" => request['email'], 
                    "password" => request['password'],
                    "name" => request['name'],
                    "firstname" => request['firstname'],
                    "birtday" => request['birtday'],
                    "tel" => request['tel'],
                }
                new_data["users"].push(jsondata2)
                File.write('./app/assets/data/data.json', JSON.generate(new_data))
                
                redirect_to "/login"
            else 
                puts "no"
            end
        end
        def profile   
        end
        def login   
        end
        def register   
        end
    end